/// Products 表（class-diagram.mermaid · Product）。
import 'package:drift/drift.dart';

/// 商品表。
class Products extends Table {
  @override
  String get dataClassName => 'ProductRow';

  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get categoryId => text()();

  TextColumn get unit => text()();

  TextColumn get barcode => text().nullable()();

  TextColumn get location => text().nullable()();

  IntColumn get lowStockThreshold => integer().withDefault(const Constant(1))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
