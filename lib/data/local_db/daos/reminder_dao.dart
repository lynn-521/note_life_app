/// ReminderDao（class-diagram.mermaid · ReminderDao）。
library;
import 'package:drift/drift.dart';

import '../../models/reminder_log.dart';
import '../../models/reminder_rule.dart';
import '../tables/reminder_log_table.dart';
import '../tables/reminder_rule_table.dart';
import 'base_dao.dart';
import '../app_database.dart';
part 'reminder_dao.g.dart';

/// 提醒规则 / 日志数据访问。
@DriftAccessor(tables: [ReminderRules, ReminderLogs])
class ReminderDao extends DatabaseAccessor<AppDatabase>
    with _$ReminderDaoMixin, BaseDao {
  /// 构造。
  ReminderDao(super.db);

  /// 获取全部启用中的规则。
  Future<List<ReminderRuleModel>> getEnabledRules() async =>
      (await (select(reminderRules)
            ..where((t) => t.enabled.equals(true) & t.deletedAt.isNull()))
          .get())
          .map(_toRule)
          .toList();

  /// 获取全部规则。
  Future<List<ReminderRuleModel>> getAllRules() async =>
      (await (select(reminderRules)..where((t) => t.deletedAt.isNull())).get())
          .map(_toRule)
          .toList();

  /// 保存规则（upsert）。
  Future<void> saveRule(ReminderRuleModel r) =>
      into(reminderRules).insertOnConflictUpdate(_toRuleCompanion(r));

  /// 写入下发日志（upsert，供同步合并幂等）。
  Future<void> insertLog(ReminderLogModel log) =>
      into(reminderLogs).insertOnConflictUpdate(_toLogCompanion(log));

  /// 全部规则（含软删，供同步推送使用）。
  Future<List<ReminderRuleModel>> getAllRulesForSync() async =>
      (await select(reminderRules).get()).map(_toRule).toList();

  /// 全部下发日志（含软删，供同步推送使用）。
  Future<List<ReminderLogModel>> getAllLogsForSync() async =>
      (await select(reminderLogs).get()).map(_toLog).toList();

  /// 下发日志 upsert（供远端变更合并幂等）。
  Future<void> upsertLog(ReminderLogModel log) =>
      into(reminderLogs).insertOnConflictUpdate(_toLogCompanion(log));

  /// 监听下发日志（新近优先）。
  Stream<List<ReminderLogModel>> watchLogs() =>
      (select(reminderLogs)..orderBy([(t) => OrderingTerm.desc(t.firedAt)]))
          .watch()
          .map((rows) => rows.map(_toLog).toList());

  ReminderRuleModel _toRule(ReminderRule r) => ReminderRuleModel(
        id: r.id,
        type: r.type,
        sourceRef: r.sourceRef,
        channel: r.channel,
        config: r.config,
        memberId: r.memberId,
        enabled: r.enabled,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  ReminderLogModel _toLog(ReminderLog r) => ReminderLogModel(
        id: r.id,
        ruleId: r.ruleId,
        firedAt: r.firedAt,
        channel: r.channel,
        status: r.status,
        payload: r.payload,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  ReminderRulesCompanion _toRuleCompanion(ReminderRuleModel r) =>
      ReminderRulesCompanion(
        id: Value(r.id),
        type: Value(r.type),
        sourceRef: Value(r.sourceRef),
        channel: Value(r.channel),
        config: Value(r.config),
        memberId: Value(r.memberId),
        enabled: Value(r.enabled),
        createdAt: Value(r.createdAt),
        updatedAt: Value(r.updatedAt),
        version: Value(r.version),
        deletedAt: Value(r.deletedAt),
      );

  ReminderLogsCompanion _toLogCompanion(ReminderLogModel l) =>
      ReminderLogsCompanion(
        id: Value(l.id),
        ruleId: Value(l.ruleId),
        firedAt: Value(l.firedAt),
        channel: Value(l.channel),
        status: Value(l.status),
        payload: Value(l.payload),
        createdAt: Value(l.createdAt),
        updatedAt: Value(l.updatedAt),
        version: Value(l.version),
        deletedAt: Value(l.deletedAt),
      );
}
