/// 全局 Provider 装配（system_design §1.4 / app.dart 引用）。
///
/// 集中装配：数据库、渠道、调度器、提醒引擎、同步引擎、当前成员、仓储集合。
library;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:family_butler/core/constants/app_constants.dart';
import 'package:family_butler/data/local_db/app_database.dart';
import 'package:family_butler/data/models/member.dart';
import 'package:family_butler/data/models/enums.dart';
import 'package:family_butler/data/notify/group_bot_channel.dart';
import 'package:family_butler/data/notify/logging_notification_channel.dart';
import 'package:family_butler/data/notify/notification_channel.dart';
import 'package:family_butler/data/notify/reminder_dispatcher.dart';
import 'package:family_butler/data/notify/wxpusher_channel.dart';
import 'package:family_butler/data/reminder/local_reminder_engine.dart';
import 'package:family_butler/data/repositories/repository.dart';
import 'package:family_butler/data/sync/http_sync_engine.dart';
import 'package:family_butler/core/network/api_client.dart';
import 'package:family_butler/data/models/family_server_config.dart';

/// 数据库单例（lazy，dispose 时关闭）。
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// 全部仓储集合。
final repositoriesProvider = Provider<AppRepositories>((ref) {
  return AppRepositories(ref.watch(appDatabaseProvider));
});

/// MVP 默认通知渠道（本地日志桩）。
final notificationChannelProvider = Provider<NotificationChannel>((ref) {
  return const LoggingNotificationChannel();
});

/// 提醒调度器（注册全部渠道，目标渠道不可用时回退本地日志）。
final reminderDispatcherProvider = Provider<ReminderDispatcher>((ref) {
  return ReminderDispatcher({
    ChannelType.localLog: const LoggingNotificationChannel(),
    ChannelType.wxpusher: const WxPusherChannel(),
    ChannelType.groupBot: const GroupBotChannel(),
  });
});

/// 本地提醒引擎（注入 FLN + 调度器 + 仓储）。
final reminderEngineProvider = Provider<LocalReminderEngine>((ref) {
  return LocalReminderEngine(
    dispatcher: ref.watch(reminderDispatcherProvider),
    repositories: ref.watch(repositoriesProvider),
    flutterLocalNotifications: FlutterLocalNotificationsPlugin(),
  );
});

/// 家庭服务器配置（从 SharedPreferences 读取 / 保存；未配置时返回空实例）。
final familyServerConfigProvider =
    AsyncNotifierProvider<FamilyServerConfigNotifier, FamilyServerConfig>(
        FamilyServerConfigNotifier.new);

/// 家庭服务器配置 Notifier：加载初始值并提供保存。
class FamilyServerConfigNotifier extends AsyncNotifier<FamilyServerConfig> {
  @override
  Future<FamilyServerConfig> build() async {
    final prefs = await SharedPreferences.getInstance();
    return FamilyServerConfig.fromPreferences(prefs);
  }

  /// 保存配置并刷新 ApiClient（使新地址 / 令牌立即生效）。
  Future<void> save(FamilyServerConfig cfg) async {
    final prefs = await SharedPreferences.getInstance();
    await cfg.saveToPreferences(prefs);
    state = AsyncValue.data(cfg);
    ref.invalidate(apiClientProvider);
  }
}

/// 双地址自动切换 HTTP 客户端（优先内网 → 失败回退外网）。
final apiClientProvider = Provider<ApiClient>((ref) {
  final cfg = ref.watch(familyServerConfigProvider).valueOrNull ??
      FamilyServerConfig.empty();
  return ApiClient(cfg);
});

/// 真实 HTTP 同步引擎（替换本地桩：自动内/外网切换 + LWW 合并）。
final syncEngineProvider = Provider<HttpSyncEngine>((ref) {
  final api = ref.watch(apiClientProvider);
  final repos = ref.watch(repositoriesProvider);
  return HttpSyncEngine(apiClient: api, repositories: repos);
});

/// SharedPreferences 单例（本地偏好：提醒开关 / 微信绑定 / 同步时间）。
final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async => SharedPreferences.getInstance());

/// 提醒开关本地偏好（临期 / 低库存 / 用药）。
class ReminderSettings {
  /// 构造。
  const ReminderSettings({
    this.expiry = true,
    this.lowStock = true,
    this.medication = true,
  });

  /// 临期提醒。
  final bool expiry;

  /// 低库存提醒。
  final bool lowStock;

  /// 用药提醒。
  final bool medication;
}

/// 提醒开关偏好（读自 SharedPreferences）。
final reminderSettingsProvider =
    FutureProvider<ReminderSettings>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return ReminderSettings(
    expiry: prefs.getBool(AppConstants.prefExpiryReminder) ?? true,
    lowStock: prefs.getBool(AppConstants.prefLowStockReminder) ?? true,
    medication:
        prefs.getBool(AppConstants.prefMedicationReminder) ?? true,
  );
});

/// 提醒开关写入 Notifier（写 SharedPreferences + 失效缓存）。
final reminderSettingsNotifier =
    NotifierProvider<ReminderSettingsNotifier, bool>(
        ReminderSettingsNotifier.new);

class ReminderSettingsNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  /// 写入某个提醒开关。
  Future<void> set(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    ref.invalidate(reminderSettingsProvider);
  }
}

/// 最近一次同步时间（本地桩默认未同步）。
final lastSyncAtProvider = FutureProvider<DateTime?>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final ms = prefs.getInt(AppConstants.lastSyncAtKey);
  return ms == null ? null : DateTime.fromMillisecondsSinceEpoch(ms);
});

/// 当前选中的家庭成员 id（健康 Tab 切换；null 表示取首位成员）。
final currentMemberIdProvider = StateProvider<String?>((ref) => null);

/// 全部成员流（共享）。
final membersProvider =
    StreamProvider((ref) => ref.watch(repositoriesProvider).member.watchAll());

/// 当前家庭成员（解析 currentMemberIdProvider，缺省取首位）。
final currentMemberProvider = FutureProvider<MemberModel?>((ref) async {
  final members = await ref.watch(repositoriesProvider).member.getAll();
  if (members.isEmpty) return null;
  final id = ref.watch(currentMemberIdProvider);
  if (id != null) {
    final found = members.where((m) => m.id == id);
    if (found.isNotEmpty) return found.first;
  }
  return members.first;
});
