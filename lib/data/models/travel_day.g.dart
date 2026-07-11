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
      date: const UtcDateTimeConverter().fromJson(json['date'] as String),
      agenda: json['agenda'] as String? ?? '',
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$TravelDayImplToJson(_$TravelDayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'dayIndex': instance.dayIndex,
      'date': const UtcDateTimeConverter().toJson(instance.date),
      'agenda': instance.agenda,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
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
