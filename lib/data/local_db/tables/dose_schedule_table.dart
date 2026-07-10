/// DoseSchedules 表（class-diagram.mermaid · DoseSchedule）。
import 'package:drift/drift.dart';

/// 服药排程表。
class DoseSchedules extends Table {
  @override
  String get dataClassName => 'DoseScheduleRow';

  TextColumn get id => text()();

  TextColumn get medicationId => text()();

  TextColumn get memberId => text()();

  DateTimeColumn get scheduledTime => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
