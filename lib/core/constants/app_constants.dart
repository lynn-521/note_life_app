/// 应用级常量：阈值、限频窗口、本地通知渠道、SharedPreferences 键。
class AppConstants {
  AppConstants._();

  /// 临期预警默认阈值（天）。
  static const int expiryWarningDays = 3;

  /// 提醒限频窗口（同一规则在该窗口内不重复下发）。
  static const Duration rateLimitWindow = Duration(minutes: 30);

  /// 本地通知渠道（flutter_local_notifications）。
  static const String localNotifyChannelId = 'family_butler_local';
  static const String localNotifyChannelName = '家庭管家提醒';
  static const String localNotifyChannelDesc = '库存/服药/备忘本地提醒';

  /// 用药提醒通知 ID 段起始（避免与其它通知冲突）。
  static const int doseNotifyIdBase = 100000;

  /// 备忘录提醒通知 ID 段起始。
  static const int memoNotifyIdBase = 200000;

  /// SharedPreferences 键。
  static const String seedPrefKey = 'family_butler_seeded_v1';
  static const String lastSyncAtKey = 'family_butler_last_sync_at';
  static const String currentMemberIdKey = 'family_butler_current_member_id';
  static const String wxpusherEnabledKey = 'family_butler_wxpusher_enabled';
  static const String groupBotEnabledKey = 'family_butler_group_bot_enabled';

  /// 提醒开关本地偏好键。
  static const String prefExpiryReminder = 'family_butler_reminder_expiry';
  static const String prefLowStockReminder = 'family_butler_reminder_lowstock';
  static const String prefMedicationReminder = 'family_butler_reminder_medication';

  /// 应用名。
  static const String appName = '综合家庭管家';
}
