/// OutboundOrders 表（class-diagram.mermaid · OutboundOrder）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 出库单表（事件溯源：append-only）。
class OutboundOrders extends Table {
  @override
  String get dataClassName => 'OutboundOrderRow';

  TextColumn get id => text()();

  TextColumn get productId => text()();

  RealColumn get qty => real()();

  TextColumn get reason =>
      text().map(const EnumConverter<OutboundReason>(OutboundReason.values))();

  TextColumn get operatorId => text()();

  DateTimeColumn get at => dateTime()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
