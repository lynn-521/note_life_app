/// 菜谱「谁会做」关联实体（class-diagram.mermaid · RecipeCookableByModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_cookable_by.freezed.dart';
part 'recipe_cookable_by.g.dart';

/// 菜谱与成员的多对多关联（谁会做这道菜）。
@freezed
class RecipeCookableByModel with _$RecipeCookableByModel {
  const factory RecipeCookableByModel({
    required String recipeId,
    required String memberId,
  }) = _RecipeCookableBy;

  factory RecipeCookableByModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCookableByModelFromJson(json);
}
