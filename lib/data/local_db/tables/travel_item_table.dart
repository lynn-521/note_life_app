/// TravelItems 表（class-diagram.mermaid · TravelItemModel）。
///
/// 已补同步列 createdAt/updatedAt/version/deletedAt（对齐 backend_design §2.3）。
library;
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 旅游清单项表（行李 / 预算）。
class TravelItems extends Table {
  String get dataClassName => 'TravelItemRow';

  TextColumn get id => text()();

  TextColumn get planId => text()();

  TextColumn get type =>
      text().map(const EnumConverter<TravelItemType>(TravelItemType.values))();

  TextColumn get name => text()();

  RealColumn get qty => real().nullable()();

  RealColumn get amount => real().nullable()();

  BoolColumn get done => boolean().withDefault(const Constant(false))();

  TextColumn get assignedTo => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
