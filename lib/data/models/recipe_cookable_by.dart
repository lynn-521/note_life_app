/// 菜谱「谁会做」关联实体（class-diagram.mermaid · RecipeCookableBy）。
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_cookable_by.freezed.dart';

/// 菜谱与成员的多对多关联（谁会做这道菜）。
@freezed
class RecipeCookableBy with _$RecipeCookableBy {
  const factory RecipeCookableBy({
    required String recipeId,
    required String memberId,
  }) = _RecipeCookableBy;

  factory RecipeCookableBy.fromJson(Map<String, dynamic> json) =>
      _$RecipeCookableByFromJson(json);
}
