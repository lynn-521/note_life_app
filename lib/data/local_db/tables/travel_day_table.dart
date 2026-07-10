/// TravelDays 表（class-diagram.mermaid · TravelDay）。
///
/// 已补同步列 createdAt/updatedAt/version/deletedAt（对齐 backend_design §2.3）。
import 'package:drift/drift.dart';

/// 旅游行程日表。
class TravelDays extends Table {
  @override
  String get dataClassName => 'TravelDayRow';

  TextColumn get id => text()();

  TextColumn get planId => text()();

  IntColumn get dayIndex => integer()();

  DateTimeColumn get date => dateTime()();

  TextColumn get agenda => text().withDefault(const Constant(''))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
