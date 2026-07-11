/// Recipes 表（class-diagram.mermaid · RecipeModel）。
library;
import 'package:drift/drift.dart';

import '../converters/drift_converters.dart';

/// 菜谱表（食材与「谁会做」存于独立关联表）。
class Recipes extends Table {
  String get dataClassName => 'RecipeRow';

  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get steps => text()();

  IntColumn get servings => integer().withDefault(const Constant(1))();

  TextColumn get tags => text().map(const StringListConverter())();

  TextColumn get authorId => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
