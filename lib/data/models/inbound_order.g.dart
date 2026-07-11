// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbound_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InboundOrderImpl _$$InboundOrderImplFromJson(Map<String, dynamic> json) =>
    _$InboundOrderImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      qty: json['qty'] as num,
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

Map<String, dynamic> _$$InboundOrderImplToJson(_$InboundOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'qty': instance.qty,
      'operatorId': instance.operatorId,
      'at': const UtcDateTimeConverter().toJson(instance.at),
      'note': instance.note,
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
