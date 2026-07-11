/// GroupBotChannel（占位 · 未配置优雅降级，不抛异常）。
library;
import 'notification_channel.dart';
import '../models/enums.dart';

/// 企业微信群机器人渠道占位。
///
/// 真实接入需群 Webhook 地址，POST markdown 消息。
/// 当前未配置时返回 [SendResult.success]==false，便于调度器优雅降级。
class GroupBotChannel implements NotificationChannel {
  /// 构造。
  const GroupBotChannel();

  @override
  ChannelType get type => ChannelType.groupBot;

  @override
  Future<SendResult> send({
    required List<String> targets,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    // TODO(接入): POST 企业微信群机器人 Webhook（markdown 消息）。
    return const SendResult(
      success: false,
      failureReason: '企业微信群机器人 Webhook 未配置',
    );
  }
}
