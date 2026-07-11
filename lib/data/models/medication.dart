/// 用药计划实体（class-diagram.mermaid · MedicationModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

import 'base/sync_entity.dart';
import 'enums.dart';
import '../../core/utils/json_converters.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

/// 用药计划：按成员绑定，含频次与每日服药时间点。
@freezed
class MedicationModel with _$MedicationModel, SyncEntity {
  const factory MedicationModel({
    required String id,
    required String memberId,
    required String name,
    @Default(MedicationType.medicine) MedicationType type,
    required String dosage,
    @Default(Frequency.dailyN) Frequency frequency,
    @TimeOfDayListConverter()
    required List<TimeOfDay> times,
    @UtcDateTimeConverter() DateTime? startDate,
    @UtcDateTimeConverter() DateTime? endDate,
    @Default(true) bool active,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _Medication;

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationModelFromJson(json);
}
