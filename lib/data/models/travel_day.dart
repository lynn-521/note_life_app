/// 旅游行程日实体（class-diagram.mermaid · TravelDayModel）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'travel_day.freezed.dart';
part 'travel_day.g.dart';

/// 旅游行程中的某一天（行程安排）。
@freezed
class TravelDayModel with _$TravelDayModel, SyncEntity {
  const factory TravelDayModel({
    required String id,
    required String planId,
    required int dayIndex,
    required DateTime date,
    @Default('') String agenda,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _TravelDay;

  factory TravelDayModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDayModelFromJson(json);
}
