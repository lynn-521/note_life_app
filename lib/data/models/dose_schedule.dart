/// 服药排程实体（class-diagram.mermaid · DoseScheduleModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'dose_schedule.freezed.dart';

/// 服药排程：用药计划展开后的某一具体服药时刻（每日按 times 生成）。
@freezed
class DoseScheduleModel with _$DoseScheduleModel, SyncEntity {
  const factory DoseScheduleModel({
    required String id,
    required String medicationId,
    required String memberId,
    required DateTime scheduledTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _DoseSchedule;

  factory DoseScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$DoseScheduleModelFromJson(json);
}
