/// 菜谱食材实体（class-diagram.mermaid · RecipeIngredient）。
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient.freezed.dart';

/// 菜谱食材：菜谱与商品的关联（承载用量与单位）。
@freezed
class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required String productId,
    required num amount,
    String? unit,
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);
}
