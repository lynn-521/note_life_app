/// 菜谱实体（class-diagram.mermaid · Recipe）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'recipe_cookable_by.dart';
import 'recipe_ingredient.dart';

part 'recipe.freezed.dart';

/// 菜谱：含步骤、份数、标签、食材清单与「谁会做」成员列表。
@freezed
class Recipe with _$Recipe, SyncEntity {
  const factory Recipe({
    required String id,
    required String name,
    required String steps,
    @Default(1) int servings,
    @Default(<String>[]) List<String> tags,
    required String authorId,
    @Default(<RecipeIngredient>[]) List<RecipeIngredient> ingredients,
    @Default(<String>[]) List<String> cookableBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);
}
