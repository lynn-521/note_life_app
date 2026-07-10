/// Medications 表（class-diagram.mermaid · Medication）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 用药计划表。
class Medications extends Table {
  @override
  String get dataClassName => 'MedicationRow';

  TextColumn get id => text()();

  TextColumn get memberId => text()();

  TextColumn get name => text()();

  TextColumn get type =>
      text().map(const EnumConverter<MedicationType>(MedicationType.values))();

  TextColumn get dosage => text()();

  TextColumn get frequency =>
      text().map(const EnumConverter<Frequency>(Frequency.values))();

  TextColumn get times => text().map(const DriftTimeOfDayListConverter())();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  BoolColumn get active => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
