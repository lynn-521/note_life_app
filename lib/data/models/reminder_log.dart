/// 提醒下发日志实体（class-diagram.mermaid · ReminderLog）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'reminder_log.freezed.dart';

/// 提醒下发记录：某规则在某时刻经某渠道下发的状态。
@freezed
class ReminderLog with _$ReminderLog, SyncEntity {
  const factory ReminderLog({
    required String id,
    required String ruleId,
    required DateTime firedAt,
    @Default(ChannelType.localLog) ChannelType channel,
    @Default('pending') String status,
    String? payload,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _ReminderLog;

  factory ReminderLog.fromJson(Map<String, dynamic> json) =>
      _$ReminderLogFromJson(json);
}
