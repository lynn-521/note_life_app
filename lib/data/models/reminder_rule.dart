/// 提醒规则实体（class-diagram.mermaid · ReminderRule）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'reminder_rule.freezed.dart';

/// 提醒规则：类型 + 来源引用 + 渠道 + 配置 + 是否启用。
@freezed
class ReminderRule with _$ReminderRule, SyncEntity {
  const factory ReminderRule({
    required String id,
    required ReminderType type,
    required String sourceRef,
    @Default(ChannelType.localLog) ChannelType channel,
    @Default(<String, dynamic>{}) Map<String, dynamic> config,
    String? memberId,
    @Default(true) bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _ReminderRule;

  factory ReminderRule.fromJson(Map<String, dynamic> json) =>
      _$ReminderRuleFromJson(json);
}
