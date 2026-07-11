/// 旅游计划书实体（class-diagram.mermaid · TravelPlanModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'travel_plan.freezed.dart';
part 'travel_plan.g.dart';

/// 旅游计划书：起止日期 + 参与成员。
@freezed
class TravelPlanModel with _$TravelPlanModel, SyncEntity {
  const factory TravelPlanModel({
    required String id,
    required String title,
    required DateTime start,
    required DateTime end,
    @Default(<String>[]) List<String> memberIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _TravelPlan;

  factory TravelPlanModel.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanModelFromJson(json);
}
