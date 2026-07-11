// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoseLogImpl _$$DoseLogImplFromJson(Map<String, dynamic> json) =>
    _$DoseLogImpl(
      id: json['id'] as String,
      medicationId: json['medicationId'] as String,
      memberId: json['memberId'] as String,
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      status: $enumDecodeNullable(_$DoseStatusEnumMap, json['status']) ??
          DoseStatus.pending,
      takenAt: json['takenAt'] == null
          ? null
          : DateTime.parse(json['takenAt'] as String),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$DoseLogImplToJson(_$DoseLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'memberId': instance.memberId,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'status': _$DoseStatusEnumMap[instance.status]!,
      'takenAt': instance.takenAt?.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$DoseStatusEnumMap = {
  DoseStatus.pending: 'pending',
  DoseStatus.done: 'done',
  DoseStatus.skipped: 'skipped',
};
