// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockBatchImpl _$$StockBatchImplFromJson(Map<String, dynamic> json) =>
    _$StockBatchImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as num,
      expireDate: _$JsonConverterFromJson<String, DateTime>(
          json['expireDate'], const UtcDateTimeConverter().fromJson),
      batchNo: json['batchNo'] as String?,
      inboundAt:
          const UtcDateTimeConverter().fromJson(json['inboundAt'] as String),
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$StockBatchImplToJson(_$StockBatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'expireDate': _$JsonConverterToJson<String, DateTime>(
          instance.expireDate, const UtcDateTimeConverter().toJson),
      'batchNo': instance.batchNo,
      'inboundAt': const UtcDateTimeConverter().toJson(instance.inboundAt),
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
