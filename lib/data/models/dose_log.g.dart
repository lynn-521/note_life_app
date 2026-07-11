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
      scheduledTime: const UtcDateTimeConverter()
          .fromJson(json['scheduledTime'] as String),
      status: $enumDecodeNullable(_$DoseStatusEnumMap, json['status']) ??
          DoseStatus.pending,
      takenAt: _$JsonConverterFromJson<String, DateTime>(
          json['takenAt'], const UtcDateTimeConverter().fromJson),
      note: json['note'] as String?,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$DoseLogImplToJson(_$DoseLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'memberId': instance.memberId,
      'scheduledTime':
          const UtcDateTimeConverter().toJson(instance.scheduledTime),
      'status': _$DoseStatusEnumMap[instance.status]!,
      'takenAt': _$JsonConverterToJson<String, DateTime>(
          instance.takenAt, const UtcDateTimeConverter().toJson),
      'note': instance.note,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$DoseStatusEnumMap = {
  DoseStatus.pending: 'pending',
  DoseStatus.done: 'done',
  DoseStatus.skipped: 'skipped',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
