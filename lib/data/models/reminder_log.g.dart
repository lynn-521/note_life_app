// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderLogImpl _$$ReminderLogImplFromJson(Map<String, dynamic> json) =>
    _$ReminderLogImpl(
      id: json['id'] as String,
      ruleId: json['ruleId'] as String,
      firedAt: const UtcDateTimeConverter().fromJson(json['firedAt'] as String),
      channel: $enumDecodeNullable(_$ChannelTypeEnumMap, json['channel']) ??
          ChannelType.localLog,
      status: json['status'] as String? ?? 'pending',
      payload: json['payload'] as String?,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$ReminderLogImplToJson(_$ReminderLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ruleId': instance.ruleId,
      'firedAt': const UtcDateTimeConverter().toJson(instance.firedAt),
      'channel': _$ChannelTypeEnumMap[instance.channel]!,
      'status': instance.status,
      'payload': instance.payload,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
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
