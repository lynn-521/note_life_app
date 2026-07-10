/// RecipeRepository（class-diagram.mermaid · RecipeRepository）。
import '../../models/daily_meal.dart';
import '../../models/recipe.dart';
import '../local_db/app_database.dart';

/// 菜谱 / 今日菜单仓储接口。
abstract class RecipeRepository {
  /// 监听全部菜谱（含食材 / 谁会做）。
  Stream<List<Recipe>> watchAll();

  /// 获取全部菜谱（含食材 / 谁会做）。
  Future<List<Recipe>> getAll();

  /// 按 id 获取菜谱。
  Future<Recipe?> getById(String id);

  /// 保存菜谱（含关联）。
  Future<void> saveRecipe(Recipe recipe);

  /// 软删菜谱。
  Future<void> deleteRecipe(String id);

  /// 监听某日菜单。
  Stream<List<DailyMeal>> watchDailyMeals(DateTime date);

  /// 获取某日菜单。
  Future<List<DailyMeal>> getDailyMeals(DateTime date);

  /// 添加排菜。
  Future<void> addDailyMeal(DailyMeal meal);

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
  Stream<List<Recipe>> watchAll() => db.recipeDao.watchAllDetailed();

  @override
  Future<List<Recipe>> getAll() => db.recipeDao.getAll();

  @override
  Future<Recipe?> getById(String id) => db.recipeDao.getById(id);

  @override
  Future<void> saveRecipe(Recipe recipe) => db.recipeDao.saveRecipe(recipe);

  @override
  Future<void> deleteRecipe(String id) => db.recipeDao.softDeleteRecipe(id);

  @override
  Stream<List<DailyMeal>> watchDailyMeals(DateTime date) =>
      db.recipeDao.watchDailyMeals(date);

  @override
  Future<List<DailyMeal>> getDailyMeals(DateTime date) =>
      db.recipeDao.getDailyMeals(date);

  @override
  Future<void> addDailyMeal(DailyMeal meal) => db.recipeDao.addDailyMeal(meal);

  @override
  Future<void> removeDailyMeal(String id) =>
      db.recipeDao.removeDailyMeal(id);
}
