/// NotificationChannel 抽象 + SendResult（system_design §3.4 / §1.7）。
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/enums.dart';

part 'notification_channel.freezed.dart';

/// 下发结果。
@freezed
class SendResult with _$SendResult {
  const factory SendResult({
    required bool success,
    String? message,
    String? failureReason,
  }) = _SendResult;
}

/// 通知渠道统一出口（微信 / 群机器人 / 本地日志等可插拔）。
abstract class NotificationChannel {
  /// 渠道类型。
  ChannelType get type;

  /// 发送通知。
  Future<SendResult> send({
    required List<String> targets,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  });
}
