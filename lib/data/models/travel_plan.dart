/// 旅游计划书实体（class-diagram.mermaid · TravelPlanModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import '../../core/utils/json_converters.dart';

part 'travel_plan.freezed.dart';
part 'travel_plan.g.dart';

/// 旅游计划书：起止日期 + 参与成员。
@freezed
class TravelPlanModel with _$TravelPlanModel, SyncEntity {
  const factory TravelPlanModel({
    required String id,
    required String title,
    @UtcDateTimeConverter() required DateTime start,
    @UtcDateTimeConverter() required DateTime end,
    @Default(<String>[]) List<String> memberIds,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _TravelPlan;

  factory TravelPlanModel.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanModelFromJson(json);
}
