/// 服药记录实体（class-diagram.mermaid · DoseLogModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';
import '../../core/utils/json_converters.dart';

part 'dose_log.freezed.dart';
part 'dose_log.g.dart';

/// 服药记录：某用药计划在某时刻的实际打卡（done / skipped / pending）。
///
/// id 由 [core/utils/id_generator.dart] 的 `doseLogId` 确定性生成，
/// 便于 upsert 与幂等打卡。
@freezed
class DoseLogModel with _$DoseLogModel, SyncEntity {
  const factory DoseLogModel({
    required String id,
    required String medicationId,
    required String memberId,
    @UtcDateTimeConverter() required DateTime scheduledTime,
    @Default(DoseStatus.pending) DoseStatus status,
    @UtcDateTimeConverter() DateTime? takenAt,
    String? note,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _DoseLog;

  factory DoseLogModel.fromJson(Map<String, dynamic> json) =>
      _$DoseLogModelFromJson(json);
}
