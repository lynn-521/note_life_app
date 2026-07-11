// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelDayImpl _$$TravelDayImplFromJson(Map<String, dynamic> json) =>
    _$TravelDayImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      dayIndex: (json['dayIndex'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      agenda: json['agenda'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$TravelDayImplToJson(_$TravelDayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'dayIndex': instance.dayIndex,
      'date': instance.date.toIso8601String(),
      'agenda': instance.agenda,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
