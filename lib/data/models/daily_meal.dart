/// 今日菜单实体（class-diagram.mermaid · DailyMealModel）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';
import '../../core/utils/json_converters.dart';

part 'daily_meal.freezed.dart';
part 'daily_meal.g.dart';

/// 某日某餐别排的菜（关联菜谱）。
@freezed
class DailyMealModel with _$DailyMealModel, SyncEntity {
  const factory DailyMealModel({
    required String id,
    @UtcDateTimeConverter() required DateTime date,
    required MealType mealType,
    required String recipeId,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _DailyMeal;

  factory DailyMealModel.fromJson(Map<String, dynamic> json) =>
      _$DailyMealModelFromJson(json);
}
