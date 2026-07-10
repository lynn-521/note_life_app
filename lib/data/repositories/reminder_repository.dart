/// ReminderRepository（class-diagram.mermaid · ReminderRepository）。
import '../../models/reminder_log.dart';
import '../../models/reminder_rule.dart';
import '../local_db/app_database.dart';

/// 提醒规则 / 日志仓储接口。
abstract class ReminderRepository {
  /// 获取全部启用中的规则。
  Future<List<ReminderRule>> getEnabledRules();

  /// 获取全部规则。
  Future<List<ReminderRule>> getAllRules();

  /// 保存规则（upsert）。
  Future<void> saveRule(ReminderRule rule);

  /// 写入下发日志。
  Future<void> insertLog(ReminderLog log);

  /// 监听下发日志。
  Stream<List<ReminderLog>> watchLogs();
}

/// 基于 Drift 的实现。
class ReminderRepositoryImpl implements ReminderRepository {
  /// 构造。
  ReminderRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<List<ReminderRule>> getEnabledRules() =>
      db.reminderDao.getEnabledRules();

  @override
  Future<List<ReminderRule>> getAllRules() => db.reminderDao.getAllRules();

  @override
  Future<void> saveRule(ReminderRule rule) => db.reminderDao.saveRule(rule);

  @override
  Future<void> insertLog(ReminderLog log) => db.reminderDao.insertLog(log);

  @override
  Stream<List<ReminderLog>> watchLogs() => db.reminderDao.watchLogs();
}
