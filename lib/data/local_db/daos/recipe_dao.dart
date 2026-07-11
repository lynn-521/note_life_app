/// RecipeDao（class-diagram.mermaid · RecipeDao）。
///
/// 菜谱 + 食材关联 + 谁会做关联 + 今日菜单。
library;
import 'package:drift/drift.dart';

import '../../models/daily_meal.dart';
import '../../models/recipe.dart';
import '../../models/recipe_ingredient.dart';
import '../tables/daily_meal_table.dart';
import '../tables/recipe_cookable_by_table.dart';
import '../tables/recipe_ingredient_table.dart';
import '../tables/recipe_table.dart';
import 'base_dao.dart';
import '../app_database.dart';
import 'package:family_butler/core/utils/datetime_ext.dart';
part 'recipe_dao.g.dart';

/// 菜谱数据访问。
@DriftAccessor(tables: [
  Recipes,
  RecipeIngredients,
  RecipeCookableBys,
  DailyMeals,
])
class RecipeDao extends DatabaseAccessor<AppDatabase>
    with _$RecipeDaoMixin, BaseDao {
  /// 构造。
  RecipeDao(super.db);

  /// 监听全部未删除菜谱（含食材与谁会做）。
  Stream<List<RecipeModel>> watchAllDetailed() async* {
    await for (final base in (select(recipes)
          ..where((t) => t.deletedAt.isNull()))
        .watch()) {
      final detailed = <RecipeModel>[];
      for (final r in base) {
        detailed.add(await _withDetails(r));
      }
      yield detailed;
    }
  }

  /// 获取全部未删除菜谱（含食材与谁会做）。
  Future<List<RecipeModel>> getAll() async {
    final base = await (select(recipes)..where((t) => t.deletedAt.isNull()))
        .get();
    final detailed = <RecipeModel>[];
    for (final r in base) {
      detailed.add(await _withDetails(r));
    }
    return detailed;
  }

  /// 按 id 获取菜谱（含食材与谁会做）。
  Future<RecipeModel?> getById(String id) async {
    final row = await (select(recipes)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _withDetails(row);
  }

  /// 保存菜谱（upsert 菜谱 + 替换食材 / 谁会做）。
  Future<void> saveRecipe(RecipeModel r) async {
    await db.transaction(() async {
      await into(recipes).insertOnConflictUpdate(_toRecipeCompanion(r));
      await (delete(recipeIngredients)
            ..where((t) => t.recipeId.equals(r.id)))
          .go();
      for (final ing in r.ingredients) {
        await into(recipeIngredients).insert(_toIngredientCompanion(r.id, ing));
      }
      await (delete(recipeCookableBys)
            ..where((t) => t.recipeId.equals(r.id)))
          .go();
      for (final memberId in r.cookableBy) {
        await into(recipeCookableBys)
            .insert(RecipeCookableBysCompanion(
          recipeId: Value(r.id),
          memberId: Value(memberId),
        ));
      }
    });
  }

  /// 软删菜谱（级联删除拥有的关联行）。
  Future<void> softDeleteRecipe(String id) async {
    await db.transaction(() async {
      await (update(recipes)..where((t) => t.id.equals(id)))
          .write(RecipesCompanion(deletedAt: Value(now)));
      await (delete(recipeIngredients)..where((t) => t.recipeId.equals(id)))
          .go();
      await (delete(recipeCookableBys)..where((t) => t.recipeId.equals(id)))
          .go();
    });
  }

  /// 监听某日菜单。
  Stream<List<DailyMealModel>> watchDailyMeals(DateTime date) {
    final day = date.dateOnly;
    return (select(dailyMeals)
          ..where((t) => t.date.equals(day))
          ..orderBy([(t) => OrderingTerm.asc(t.mealType)]))
        .watch()
        .map((rows) => rows.map(_toDailyMeal).toList());
  }

  /// 获取某日菜单。
  Future<List<DailyMealModel>> getDailyMeals(DateTime date) async {
    final day = date.dateOnly;
    return (await (select(dailyMeals)..where((t) => t.date.equals(day))).get())
        .map(_toDailyMeal)
        .toList();
  }

  /// 添加 / 更新排菜（upsert，供同步合并幂等）。
  Future<void> addDailyMeal(DailyMealModel meal) =>
      into(dailyMeals).insertOnConflictUpdate(_toDailyMealCompanion(meal));

  /// 移除排菜。
  Future<void> removeDailyMeal(String id) =>
      (delete(dailyMeals)..where((t) => t.id.equals(id))).go();

  /// 获取全部菜谱（含软删，供同步推送使用）。
  Future<List<RecipeModel>> getAllRecipesForSync() async =>
      (await select(recipes).get()).map(_toRecipe).toList();

  /// 获取全部每日菜单（含软删，供同步推送使用）。
  Future<List<DailyMealModel>> getAllDailyMealsForSync() async =>
      (await select(dailyMeals).get()).map(_toDailyMeal).toList();

  Future<RecipeModel> _withDetails(Recipe r) async {
    final ingRows = await (select(recipeIngredients)
          ..where((t) => t.recipeId.equals(r.id)))
        .get();
    final cookRows = await (select(recipeCookableBys)
          ..where((t) => t.recipeId.equals(r.id)))
        .get();
    return RecipeModel(
      id: r.id,
      name: r.name,
      steps: r.steps,
      servings: r.servings,
      tags: r.tags,
      authorId: r.authorId,
      ingredients: ingRows.map(_toIngredient).toList(),
      cookableBy: cookRows.map((c) => c.memberId).toList(),
      createdAt: r.createdAt,
      updatedAt: r.updatedAt,
      version: r.version,
      deletedAt: r.deletedAt,
    );
  }

  RecipeModel _toRecipe(Recipe r) => RecipeModel(
        id: r.id,
        name: r.name,
        steps: r.steps,
        servings: r.servings,
        tags: r.tags,
        authorId: r.authorId,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  RecipeIngredientModel _toIngredient(RecipeIngredient r) => RecipeIngredientModel(
        productId: r.productId,
        amount: r.amount,
        unit: r.unit,
      );

  DailyMealModel _toDailyMeal(DailyMeal r) => DailyMealModel(
        id: r.id,
        date: r.date,
        mealType: r.mealType,
        recipeId: r.recipeId,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  RecipesCompanion _toRecipeCompanion(RecipeModel r) => RecipesCompanion(
        id: Value(r.id),
        name: Value(r.name),
        steps: Value(r.steps),
        servings: Value(r.servings),
        tags: Value(r.tags),
        authorId: Value(r.authorId),
        createdAt: Value(r.createdAt),
        updatedAt: Value(r.updatedAt),
        version: Value(r.version),
        deletedAt: Value(r.deletedAt),
      );

  RecipeIngredientsCompanion _toIngredientCompanion(
          String recipeId, RecipeIngredientModel ing) =>
      RecipeIngredientsCompanion(
        recipeId: Value(recipeId),
        productId: Value(ing.productId),
        amount: Value(ing.amount.toDouble()),
        unit: Value(ing.unit),
      );

  DailyMealsCompanion _toDailyMealCompanion(DailyMealModel m) =>
      DailyMealsCompanion(
        id: Value(m.id),
        date: Value(m.date),
        mealType: Value(m.mealType),
        recipeId: Value(m.recipeId),
        createdAt: Value(m.createdAt),
        updatedAt: Value(m.updatedAt),
        version: Value(m.version),
        deletedAt: Value(m.deletedAt),
      );
}
