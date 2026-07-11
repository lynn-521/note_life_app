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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$TravelItemTypeEnumMap = {
  TravelItemType.luggage: 'luggage',
  TravelItemType.budget: 'budget',
};
