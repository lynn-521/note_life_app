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
      at: DateTime.parse(json['at'] as String),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$OutboundOrderImplToJson(_$OutboundOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'qty': instance.qty,
      'reason': _$OutboundReasonEnumMap[instance.reason]!,
      'operatorId': instance.operatorId,
      'at': instance.at.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$OutboundReasonEnumMap = {
  OutboundReason.consume: 'consume',
  OutboundReason.discard: 'discard',
  OutboundReason.other: 'other',
};
