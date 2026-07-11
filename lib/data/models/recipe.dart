/// 菜谱实体（class-diagram.mermaid · RecipeModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'recipe_ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

/// 菜谱：含步骤、份数、标签、食材清单与「谁会做」成员列表。
@freezed
class RecipeModel with _$RecipeModel, SyncEntity {
  const factory RecipeModel({
    required String id,
    required String name,
    required String steps,
    @Default(1) int servings,
    @Default(<String>[]) List<String> tags,
    required String authorId,
    @Default(<RecipeIngredientModel>[]) List<RecipeIngredientModel> ingredients,
    @Default(<String>[]) List<String> cookableBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Recipe;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
