/// WxPusherChannel（占位 · 未配置优雅降级，不抛异常）。
library;
import 'notification_channel.dart';
import '../models/enums.dart';

/// WxPusher 推送渠道占位。
///
/// 真实接入需 appToken + 家庭成员 UID，并调用 WxPusher REST。
/// 当前未配置时返回 [SendResult.success]==false，便于调度器优雅降级。
class WxPusherChannel implements NotificationChannel {
  /// 构造。
  const WxPusherChannel();

  @override
  ChannelType get type => ChannelType.wxpusher;

  @override
  Future<SendResult> send({
    required List<String> targets,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    // TODO(接入): 调 WxPusher REST（https://wxpusher.zjiecode.com）下发。
    return const SendResult(
      success: false,
      failureReason: 'WxPusher 未配置（需 appToken + 用户 UID）',
    );
  }
}
