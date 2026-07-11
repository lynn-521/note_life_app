/// InboundOrders 表（class-diagram.mermaid · InboundOrderModel）。
library;
import 'package:drift/drift.dart';

/// 入库单表（事件溯源：append-only）。
class InboundOrders extends Table {
  String get dataClassName => 'InboundOrderRow';

  TextColumn get id => text()();

  TextColumn get productId => text()();

  RealColumn get qty => real()();

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
