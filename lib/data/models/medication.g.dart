// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      id: json['id'] as String,
      memberId: json['memberId'] as String,
      name: json['name'] as String,
      type: $enumDecodeNullable(_$MedicationTypeEnumMap, json['type']) ??
          MedicationType.medicine,
      dosage: json['dosage'] as String,
      frequency: $enumDecodeNullable(_$FrequencyEnumMap, json['frequency']) ??
          Frequency.dailyN,
      times: const TimeOfDayListConverter()
          .fromJson(json['times'] as List<String>),
      startDate: _$JsonConverterFromJson<String, DateTime>(
          json['startDate'], const UtcDateTimeConverter().fromJson),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['endDate'], const UtcDateTimeConverter().fromJson),
      active: json['active'] as bool? ?? true,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'name': instance.name,
      'type': _$MedicationTypeEnumMap[instance.type]!,
      'dosage': instance.dosage,
      'frequency': _$FrequencyEnumMap[instance.frequency]!,
      'times': const TimeOfDayListConverter().toJson(instance.times),
      'startDate': _$JsonConverterToJson<String, DateTime>(
          instance.startDate, const UtcDateTimeConverter().toJson),
      'endDate': _$JsonConverterToJson<String, DateTime>(
          instance.endDate, const UtcDateTimeConverter().toJson),
      'active': instance.active,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$MedicationTypeEnumMap = {
  MedicationType.medicine: 'medicine',
  MedicationType.supplement: 'supplement',
};

const _$FrequencyEnumMap = {
  Frequency.dailyN: 'dailyN',
  Frequency.specific: 'specific',
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
