/// 提醒规则实体（class-diagram.mermaid · ReminderRuleModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'reminder_rule.freezed.dart';
part 'reminder_rule.g.dart';

/// 提醒规则：类型 + 来源引用 + 渠道 + 配置 + 是否启用。
@freezed
class ReminderRuleModel with _$ReminderRuleModel, SyncEntity {
  const factory ReminderRuleModel({
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

  factory ReminderRuleModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderRuleModelFromJson(json);
}
