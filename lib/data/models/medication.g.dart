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
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      active: json['active'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
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
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$MedicationTypeEnumMap = {
  MedicationType.medicine: 'medicine',
  MedicationType.supplement: 'supplement',
};

const _$FrequencyEnumMap = {
  Frequency.dailyN: 'dailyN',
  Frequency.specific: 'specific',
};
