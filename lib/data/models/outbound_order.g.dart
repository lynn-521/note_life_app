// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbound_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutboundOrderImpl _$$OutboundOrderImplFromJson(Map<String, dynamic> json) =>
    _$OutboundOrderImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      qty: json['qty'] as num,
      reason: $enumDecodeNullable(_$OutboundReasonEnumMap, json['reason']) ??
          OutboundReason.consume,
      operatorId: json['operatorId'] as String,
      at: const UtcDateTimeConverter().fromJson(json['at'] as String),
      note: json['note'] as String?,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$OutboundOrderImplToJson(_$OutboundOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'qty': instance.qty,
      'reason': _$OutboundReasonEnumMap[instance.reason]!,
      'operatorId': instance.operatorId,
      'at': const UtcDateTimeConverter().toJson(instance.at),
      'note': instance.note,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$OutboundReasonEnumMap = {
  OutboundReason.consume: 'consume',
  OutboundReason.discard: 'discard',
  OutboundReason.other: 'other',
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
