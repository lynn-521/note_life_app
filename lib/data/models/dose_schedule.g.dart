// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoseScheduleImpl _$$DoseScheduleImplFromJson(Map<String, dynamic> json) =>
    _$DoseScheduleImpl(
      id: json['id'] as String,
      medicationId: json['medicationId'] as String,
      memberId: json['memberId'] as String,
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$DoseScheduleImplToJson(_$DoseScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'memberId': instance.memberId,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
