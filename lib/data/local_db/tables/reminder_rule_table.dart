/// ReminderRules 表（class-diagram.mermaid · ReminderRule）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 提醒规则表。
class ReminderRules extends Table {
  @override
  String get dataClassName => 'ReminderRuleRow';

  TextColumn get id => text()();

  TextColumn get type =>
      text().map(const EnumConverter<ReminderType>(ReminderType.values))();

  TextColumn get sourceRef => text()();

  TextColumn get channel =>
      text().map(const EnumConverter<ChannelType>(ChannelType.values))();

  TextColumn get config => text().map(const MapConverter())();

  TextColumn get memberId => text().nullable()();

  BoolColumn get enabled => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
