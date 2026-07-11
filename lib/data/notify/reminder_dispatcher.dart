/// ReminderDispatcher（system_design §1.7 / class-diagram.mermaid）。
///
/// 按规则渠道从注册表取 channel → 下发 → 返回 [ReminderLogModel]（由引擎写入库）。
library;
import '../models/enums.dart';
import '../models/reminder_log.dart';
import '../models/reminder_rule.dart';
import '../../core/utils/id_generator.dart';
import 'notification_channel.dart';

/// 提醒调度器。
class ReminderDispatcher {
  /// 构造，注册各渠道。
  ReminderDispatcher(this._registry);

  final Map<ChannelType, NotificationChannel> _registry;

  /// 按规则下发；目标渠道不可用时回退本地日志渠道。
  Future<ReminderLogModel> dispatch(ReminderRuleModel rule) async {
    final channel =
        _registry[rule.channel] ?? _registry[ChannelType.localLog]!;
    final targets =
        rule.memberId != null ? [rule.memberId!] : <String>[];
    final res = await channel.send(
      targets: targets,
      title: _title(rule),
      body: _body(rule),
      payload: rule.config,
    );
    final now = DateTime.now();
    return ReminderLogModel(
      id: IdGenerator.newId(IdPrefix.log),
      ruleId: rule.id,
      firedAt: now,
      channel: rule.channel,
      status: res.success ? 'sent' : 'failed',
      payload: res.failureReason,
      createdAt: now,
      updatedAt: now,
      version: 1,
      deletedAt: null,
    );
  }

  String _title(ReminderRuleModel rule) {
    switch (rule.type) {
      case ReminderType.expiry:
        return '🥫 临期提醒';
      case ReminderType.lowstock:
        return '🛒 补货提醒';
      case ReminderType.medication:
        return '💊 用药提醒';
      case ReminderType.dailyRecipe:
        return '🍽️ 今日菜单';
      case ReminderType.custom:
        return '🔔 提醒';
    }
  }

  String _body(ReminderRuleModel rule) {
    switch (rule.type) {
      case ReminderType.expiry:
        return '有商品即将过期，记得尽快食用～';
      case ReminderType.lowstock:
        return '有商品库存偏低，去补点货吧～';
      case ReminderType.medication:
        return '该提醒家人按时服药啦';
      case ReminderType.dailyRecipe:
        return '今天的菜谱已排好';
      case ReminderType.custom:
        return rule.sourceRef;
    }
  }
}
