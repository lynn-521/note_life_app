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
      at: DateTime.parse(json['at'] as String),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$InboundOrderImplToJson(_$InboundOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'qty': instance.qty,
      'operatorId': instance.operatorId,
      'at': instance.at.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
