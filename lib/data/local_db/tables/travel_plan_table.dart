/// TravelPlans 表（class-diagram.mermaid · TravelPlan）。
import 'package:drift/drift.dart';

import '../converters/drift_converters.dart';

/// 旅游计划书表。
class TravelPlans extends Table {
  @override
  String get dataClassName => 'TravelPlanRow';

  TextColumn get id => text()();

  TextColumn get title => text()();

  DateTimeColumn get start => dateTime()();

  DateTimeColumn get end => dateTime()();

  TextColumn get memberIds => text().map(const StringListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
