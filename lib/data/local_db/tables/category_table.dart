/// Categories 表（class-diagram.mermaid · Category）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 商品分类表。
class Categories extends Table {
  @override
  String get dataClassName => 'CategoryRow';

  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get kind =>
      text().map(const EnumConverter<CategoryKind>(CategoryKind.values))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
