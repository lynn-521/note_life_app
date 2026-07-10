/// 餐桌模块 Provider（system_design §T07）。
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/daily_meal.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/product.dart';
import '../../../data/models/recipe.dart';
import '../../../data/models/recipe_ingredient.dart';
import '../../../providers/app_providers.dart';

/// 菜谱库（含食材 / 谁会做）。
final recipesProvider = StreamProvider<List<Recipe>>((ref) {
  return ref.watch(repositoriesProvider).recipe.watchAll();
});

/// 全部菜谱标签（去重排序）。
final allRecipeTagsProvider = Provider<List<String>>((ref) {
  final recipes = ref.watch(recipesProvider).valueOrNull ?? const <Recipe>[];
  final tags = <String>{};
  for (final r in recipes) {
    tags.addAll(r.tags);
  }
  final list = tags.toList()..sort();
  return list;
});

/// 某日菜单（按餐别）。
final todayMealsProvider =
    StreamProvider.family<List<DailyMeal>, DateTime>((ref, date) {
  return ref.watch(repositoriesProvider).recipe.watchDailyMeals(date);
});

/// 商品当前库存（用于食材反查）。
final stockOfProvider =
    FutureProvider.family<num, String>((ref, productId) {
  return ref.watch(repositoriesProvider).inventory.currentStock(productId);
});

/// 排菜后缺料信息。
class MissingIngredient {
  /// 构造。
  const MissingIngredient({
    required this.name,
    required this.need,
    required this.have,
    required this.unit,
  });

  /// 食材名。
  final String name;

  /// 需要量。
  final num need;

  /// 现有量。
  final num have;

  /// 单位（可能为空）。
  final String? unit;
}

/// 餐别中文标签。
String mealTypeLabel(MealType type) {
  switch (type) {
    case MealType.breakfast:
      return '早餐';
    case MealType.lunch:
      return '午餐';
    case MealType.dinner:
      return '晚餐';
    case MealType.snack:
      return '加餐';
  }
}

/// 排菜 Notifier：写 DailyMeal + 计算缺料。
final scheduleMealNotifier =
    NotifierProvider<ScheduleMealNotifier, bool>(ScheduleMealNotifier.new);

class ScheduleMealNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  /// 排一道菜到指定日期餐别，返回缺料清单（不强制购买）。
  Future<List<MissingIngredient>> schedule({
    required DateTime date,
    required MealType mealType,
    required String recipeId,
  }) async {
    state = true;
    try {
      final repo = ref.read(repositoriesProvider);
      final recipe = await repo.recipe.getById(recipeId);
      if (recipe == null) return const [];

      final meal = DailyMeal(
        id: IdGenerator.newId(IdPrefix.meal),
        date: date.dateOnly,
        mealType: mealType,
        recipeId: recipeId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        version: 1,
        deletedAt: null,
      );
      await repo.recipe.addDailyMeal(meal);

      final products = await repo.product.getProducts();
      final productMap = <String, Product>{
        for (final p in products) p.id: p
      };
      final missing = <MissingIngredient>[];
      for (final ing in recipe.ingredients) {
        final stock = await repo.inventory.currentStock(ing.productId);
        if (stock < ing.amount) {
          final p = productMap[ing.productId];
          missing.add(MissingIngredient(
            name: p?.name ?? ing.productId,
            need: ing.amount,
            have: stock,
            unit: ing.unit ?? p?.unit,
          ));
        }
      }
      ref.invalidate(todayMealsProvider(date.dateOnly));
      return missing;
    } finally {
      state = false;
    }
  }
}
