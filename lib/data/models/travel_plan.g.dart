// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelPlanImpl _$$TravelPlanImplFromJson(Map<String, dynamic> json) =>
    _$TravelPlanImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      start: const UtcDateTimeConverter().fromJson(json['start'] as String),
      end: const UtcDateTimeConverter().fromJson(json['end'] as String),
      memberIds: (json['memberIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$TravelPlanImplToJson(_$TravelPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': const UtcDateTimeConverter().toJson(instance.start),
      'end': const UtcDateTimeConverter().toJson(instance.end),
      'memberIds': instance.memberIds,
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
