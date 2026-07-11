/// 服药排程实体（class-diagram.mermaid · DoseScheduleModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import '../../core/utils/json_converters.dart';

part 'dose_schedule.freezed.dart';
part 'dose_schedule.g.dart';

/// 服药排程：用药计划展开后的某一具体服药时刻（每日按 times 生成）。
@freezed
class DoseScheduleModel with _$DoseScheduleModel, SyncEntity {
  const factory DoseScheduleModel({
    required String id,
    required String medicationId,
    required String memberId,
    @UtcDateTimeConverter() required DateTime scheduledTime,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _DoseSchedule;

  factory DoseScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$DoseScheduleModelFromJson(json);
}
