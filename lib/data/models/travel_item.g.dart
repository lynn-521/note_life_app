// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelItemImpl _$$TravelItemImplFromJson(Map<String, dynamic> json) =>
    _$TravelItemImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      type: $enumDecodeNullable(_$TravelItemTypeEnumMap, json['type']) ??
          TravelItemType.luggage,
      name: json['name'] as String,
      qty: json['qty'] as num?,
      amount: json['amount'] as num?,
      done: json['done'] as bool? ?? false,
      assignedTo: json['assignedTo'] as String?,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$TravelItemImplToJson(_$TravelItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'type': _$TravelItemTypeEnumMap[instance.type]!,
      'name': instance.name,
      'qty': instance.qty,
      'amount': instance.amount,
      'done': instance.done,
      'assignedTo': instance.assignedTo,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$TravelItemTypeEnumMap = {
  TravelItemType.luggage: 'luggage',
  TravelItemType.budget: 'budget',
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
