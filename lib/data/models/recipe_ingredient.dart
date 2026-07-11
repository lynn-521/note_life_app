/// 菜谱食材实体（class-diagram.mermaid · RecipeIngredientModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient.freezed.dart';
part 'recipe_ingredient.g.dart';

/// 菜谱食材：菜谱与商品的关联（承载用量与单位）。
@freezed
class RecipeIngredientModel with _$RecipeIngredientModel {
  const factory RecipeIngredientModel({
    required String productId,
    required num amount,
    String? unit,
  }) = _RecipeIngredient;

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientModelFromJson(json);
}
