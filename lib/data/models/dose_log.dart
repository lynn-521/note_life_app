/// 服药记录实体（class-diagram.mermaid · DoseLog）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'dose_log.freezed.dart';

/// 服药记录：某用药计划在某时刻的实际打卡（done / skipped / pending）。
///
/// id 由 [core/utils/id_generator.dart] 的 `doseLogId` 确定性生成，
/// 便于 upsert 与幂等打卡。
@freezed
class DoseLog with _$DoseLog, SyncEntity {
  const factory DoseLog({
    required String id,
    required String medicationId,
    required String memberId,
    required DateTime scheduledTime,
    @Default(DoseStatus.pending) DoseStatus status,
    DateTime? takenAt,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _DoseLog;

  factory DoseLog.fromJson(Map<String, dynamic> json) =>
      _$DoseLogFromJson(json);
}
