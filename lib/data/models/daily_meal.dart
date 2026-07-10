/// 今日菜单实体（class-diagram.mermaid · DailyMeal）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'daily_meal.freezed.dart';

/// 某日某餐别排的菜（关联菜谱）。
@freezed
class DailyMeal with _$DailyMeal, SyncEntity {
  const factory DailyMeal({
    required String id,
    required DateTime date,
    required MealType mealType,
    required String recipeId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _DailyMeal;

  factory DailyMeal.fromJson(Map<String, dynamic> json) =>
      _$DailyMealFromJson(json);
}
