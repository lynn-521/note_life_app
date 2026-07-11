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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
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
