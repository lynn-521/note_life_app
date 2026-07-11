/// StockBatches 表（class-diagram.mermaid · StockBatchModel）。
library;
import 'package:drift/drift.dart';

/// 库存批次表（入库即写入）。
class StockBatches extends Table {
  String get dataClassName => 'StockBatchRow';

  TextColumn get id => text()();

  TextColumn get productId => text()();

  RealColumn get quantity => real()();

  DateTimeColumn get expireDate => dateTime().nullable()();

  TextColumn get batchNo => text().nullable()();

  DateTimeColumn get inboundAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
