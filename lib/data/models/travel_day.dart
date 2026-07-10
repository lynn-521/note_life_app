/// 旅游行程日实体（class-diagram.mermaid · TravelDay）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'travel_day.freezed.dart';

/// 旅游行程中的某一天（行程安排）。
@freezed
class TravelDay with _$TravelDay, SyncEntity {
  const factory TravelDay({
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

  factory TravelDay.fromJson(Map<String, dynamic> json) =>
      _$TravelDayFromJson(json);
}
