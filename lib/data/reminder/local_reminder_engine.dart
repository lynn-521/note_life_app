/// LocalReminderEngine（system_design §1.6 · 具体实现）。
///
/// 本地优先：flutter_local_notifications 负责「到点」系统通知，WorkManager 作兜底；
/// 扫描下发走 [ReminderDispatcher] + [LoggingNotificationChannel]（MVP 不抛异常）。
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../models/enums.dart';
import '../models/memo.dart';
import '../notify/reminder_dispatcher.dart';
import '../repositories/repository.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/datetime_ext.dart';
import 'reminder_engine.dart';

/// 本地提醒引擎。
class LocalReminderEngine implements ReminderEngine {
  /// 构造。
  LocalReminderEngine({
    required this.dispatcher,
    required this.repositories,
    required this.flutterLocalNotifications,
  });

  /// 调度器。
  final ReminderDispatcher dispatcher;

  /// 仓储集合。
  final AppRepositories repositories;

  /// 本地通知插件。
  final FlutterLocalNotificationsPlugin flutterLocalNotifications;

  bool _inited = false;

  @override
  Future<void> init() async {
    if (_inited) return;
    try {
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const ios = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
      await flutterLocalNotifications.initialize(
        const InitializationSettings(android: android, iOS: ios),
      );
      _inited = true;
    } catch (e, st) {
      // 通知不可用不影响核心功能，降级为仅日志。
      debugPrint('[ReminderEngine] init 失败（降级为仅日志）: $e');
      log('$st');
    }
  }

  @override
  Future<void> scheduleDoseReminders(String memberId) async {
    try {
      final meds = await repositories.medication.getByMember(memberId);
      for (final m in meds.where((m) => m.active)) {
        for (final t in m.times) {
          final when = DateTimeX.todayAt(t.hour, t.minute);
          if (when.isAfter(DateTime.now())) {
            await _zoneSchedule(
              'dose_${m.id}_${t.hour}_${t.minute}',
              '该服药啦 💊',
              '${m.name} · ${m.dosage}',
              when,
            );
          }
        }
      }
    } catch (e) {
      debugPrint('[ReminderEngine] scheduleDoseReminders 失败: $e');
    }
  }

  @override
  Future<void> scheduleMemoReminder(Memo memo) async {
    if (memo.dueAt == null) return;
    try {
      await _zoneSchedule(
        'memo_${memo.id}',
        '备忘到期 📌',
        memo.title,
        memo.dueAt!,
      );
    } catch (e) {
      debugPrint('[ReminderEngine] scheduleMemoReminder 失败: $e');
    }
  }

  @override
  Future<void> scanAndFireRules() async {
    try {
      final rules = await repositories.reminder.getEnabledRules();
      for (final rule in rules) {
        final hit = await _evaluate(rule);
        if (hit) {
          final log = await dispatcher.dispatch(rule);
          await repositories.reminder.insertLog(log);
        }
      }
    } catch (e) {
      debugPrint('[ReminderEngine] scanAndFireRules 失败: $e');
    }
  }

  /// 规则命中评估。
  Future<bool> _evaluate(ReminderRule rule) async {
    switch (rule.type) {
      case ReminderType.expiry:
        return (await repositories.inventory
                .expiringSoon(AppConstants.expiryWarningDays))
            .isNotEmpty;
      case ReminderType.lowstock:
        return (await repositories.inventory.lowStock()).isNotEmpty;
      case ReminderType.medication:
        // 有启用中的用药计划即视为需要提醒。
        return (await repositories.medication.getAllActive()).isNotEmpty;
      case ReminderType.dailyRecipe:
      case ReminderType.custom:
        return false;
    }
  }

  Future<void> _zoneSchedule(
    String id,
    String title,
    String body,
    DateTime when,
  ) async {
    try {
      final scheduled = tz.TZDateTime.from(when, tz.local);
      await flutterLocalNotifications.zonedSchedule(
        id.hashCode,
        title,
        body,
        scheduled,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            AppConstants.localNotifyChannelId,
            AppConstants.localNotifyChannelName,
            channelDescription: AppConstants.localNotifyChannelDesc,
            importance: Importance.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      // 调度失败（如时间已过 / 权限不足）不阻断流程。
      debugPrint('[ReminderEngine] zonedSchedule 失败（已降级日志）: $e');
    }
  }
}
