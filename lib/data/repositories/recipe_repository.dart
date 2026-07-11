/// RecipeRepository（class-diagram.mermaid · RecipeRepository）。
library;
import '../models/daily_meal.dart';
import '../models/recipe.dart';
import '../local_db/app_database.dart';

/// 菜谱 / 今日菜单仓储接口。
abstract class RecipeRepository {
  /// 监听全部菜谱（含食材 / 谁会做）。
  Stream<List<RecipeModel>> watchAll();

  /// 获取全部菜谱（含食材 / 谁会做）。
  Future<List<RecipeModel>> getAll();

  /// 按 id 获取菜谱。
  Future<RecipeModel?> getById(String id);

  /// 保存菜谱（含关联）。
  Future<void> saveRecipe(RecipeModel recipe);

  /// 软删菜谱。
  Future<void> deleteRecipe(String id);

  /// 监听某日菜单。
  Stream<List<DailyMealModel>> watchDailyMeals(DateTime date);

  /// 获取某日菜单。
  Future<List<DailyMealModel>> getDailyMeals(DateTime date);

  /// 添加排菜。
  Future<void> addDailyMeal(DailyMealModel meal);

  /// 移除排菜。
  Future<void> removeDailyMeal(String id);
}

/// 基于 Drift 的实现。
class RecipeRepositoryImpl implements RecipeRepository {
  /// 构造。
  RecipeRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Stream<List<RecipeModel>> watchAll() => db.recipeDao.watchAllDetailed();

  @override
  Future<List<RecipeModel>> getAll() => db.recipeDao.getAll();

  @override
  Future<RecipeModel?> getById(String id) => db.recipeDao.getById(id);

  @override
  Future<void> saveRecipe(RecipeModel recipe) => db.recipeDao.saveRecipe(recipe);

  @override
  Future<void> deleteRecipe(String id) => db.recipeDao.softDeleteRecipe(id);

  @override
  Stream<List<DailyMealModel>> watchDailyMeals(DateTime date) =>
      db.recipeDao.watchDailyMeals(date);

  @override
  Future<List<DailyMealModel>> getDailyMeals(DateTime date) =>
      db.recipeDao.getDailyMeals(date);

  @override
  Future<void> addDailyMeal(DailyMealModel meal) => db.recipeDao.addDailyMeal(meal);

  @override
  Future<void> removeDailyMeal(String id) =>
      db.recipeDao.removeDailyMeal(id);
}
