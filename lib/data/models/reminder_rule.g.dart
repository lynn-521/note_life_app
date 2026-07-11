// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderRuleImpl _$$ReminderRuleImplFromJson(Map<String, dynamic> json) =>
    _$ReminderRuleImpl(
      id: json['id'] as String,
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      sourceRef: json['sourceRef'] as String,
      channel: $enumDecodeNullable(_$ChannelTypeEnumMap, json['channel']) ??
          ChannelType.localLog,
      config:
          json['config'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      memberId: json['memberId'] as String?,
      enabled: json['enabled'] as bool? ?? true,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$ReminderRuleImplToJson(_$ReminderRuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'sourceRef': instance.sourceRef,
      'channel': _$ChannelTypeEnumMap[instance.channel]!,
      'config': instance.config,
      'memberId': instance.memberId,
      'enabled': instance.enabled,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$ReminderTypeEnumMap = {
  ReminderType.expiry: 'expiry',
  ReminderType.lowstock: 'lowstock',
  ReminderType.medication: 'medication',
  ReminderType.dailyRecipe: 'dailyRecipe',
  ReminderType.custom: 'custom',
};

const _$ChannelTypeEnumMap = {
  ChannelType.wxpusher: 'wxpusher',
  ChannelType.groupBot: 'groupBot',
  ChannelType.oa: 'oa',
  ChannelType.miniProgram: 'miniProgram',
  ChannelType.localLog: 'localLog',
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
