// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderLogImpl _$$ReminderLogImplFromJson(Map<String, dynamic> json) =>
    _$ReminderLogImpl(
      id: json['id'] as String,
      ruleId: json['ruleId'] as String,
      firedAt: DateTime.parse(json['firedAt'] as String),
      channel: $enumDecodeNullable(_$ChannelTypeEnumMap, json['channel']) ??
          ChannelType.localLog,
      status: json['status'] as String? ?? 'pending',
      payload: json['payload'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$ReminderLogImplToJson(_$ReminderLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ruleId': instance.ruleId,
      'firedAt': instance.firedAt.toIso8601String(),
      'channel': _$ChannelTypeEnumMap[instance.channel]!,
      'status': instance.status,
      'payload': instance.payload,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$ChannelTypeEnumMap = {
  ChannelType.wxpusher: 'wxpusher',
  ChannelType.groupBot: 'groupBot',
  ChannelType.oa: 'oa',
  ChannelType.miniProgram: 'miniProgram',
  ChannelType.localLog: 'localLog',
};
