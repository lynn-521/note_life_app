/// RecipeCookableBys 表（class-diagram.mermaid · RecipeCookableByModel）。
library;
import 'package:drift/drift.dart';

/// 菜谱「谁会做」关联表（菜谱 ↔ 成员，多对多）。
class RecipeCookableBys extends Table {
  String get dataClassName => 'RecipeCookableByRow';

  TextColumn get recipeId => text()();

  TextColumn get memberId => text()();

  @override
  Set<Column> get primaryKey => {recipeId, memberId};
}
