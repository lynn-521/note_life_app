/// LoggingNotificationChannel（system_design §1.7 · MVP 默认桩）。
///
/// 本地日志代替微信下发，让全链路跑通且无副作用、不抛异常。
library;
import 'package:flutter/foundation.dart';

import 'notification_channel.dart';
import '../models/enums.dart';

/// 默认日志渠道：打印到控制台，模拟「已送达」。
class LoggingNotificationChannel implements NotificationChannel {
  /// 构造。
  const LoggingNotificationChannel();

  @override
  ChannelType get type => ChannelType.localLog;

  @override
  Future<SendResult> send({
    required List<String> targets,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    debugPrint('[Notify][LOG] -> ${targets.join(', ')} | $title | $body');
    return const SendResult(success: true, message: 'logged');
  }
}
