/// ReminderLogs 表（class-diagram.mermaid · ReminderLog）。
///
/// 已补同步列 createdAt/updatedAt/version/deletedAt（对齐 backend_design §2.3）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 提醒下发日志表。
class ReminderLogs extends Table {
  @override
  String get dataClassName => 'ReminderLogRow';

  TextColumn get id => text()();

  TextColumn get ruleId => text()();

  DateTimeColumn get firedAt => dateTime()();

  TextColumn get channel =>
      text().map(const EnumConverter<ChannelType>(ChannelType.values))();

  TextColumn get status => text().withDefault(const Constant('pending'))();

  TextColumn get payload => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
