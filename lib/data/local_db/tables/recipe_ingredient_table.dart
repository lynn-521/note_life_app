/// RecipeIngredients 表（class-diagram.mermaid · RecipeIngredient）。
import 'package:drift/drift.dart';

/// 菜谱食材关联表（菜谱 ↔ 商品）。
class RecipeIngredients extends Table {
  @override
  String get dataClassName => 'RecipeIngredientRow';

  TextColumn get recipeId => text()();

  TextColumn get productId => text()();

  RealColumn get amount => real()();

  TextColumn get unit => text().nullable()();

  @override
  Set<Column> get primaryKey => {recipeId, productId};
}
