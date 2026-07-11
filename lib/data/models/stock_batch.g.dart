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
      expireDate: json['expireDate'] == null
          ? null
          : DateTime.parse(json['expireDate'] as String),
      batchNo: json['batchNo'] as String?,
      inboundAt: DateTime.parse(json['inboundAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$StockBatchImplToJson(_$StockBatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'expireDate': instance.expireDate?.toIso8601String(),
      'batchNo': instance.batchNo,
      'inboundAt': instance.inboundAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
