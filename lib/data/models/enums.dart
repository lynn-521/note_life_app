/// 全局枚举（system_design §3.1 / class-diagram.mermaid）。
///
/// 枚举值名称与 JSON 字符串、Drift 存储字符串完全一致（小写蛇形）。
/// 序列化由 freezed / json_serializable 默认按 `.name` 处理；Drift 经
/// [data/local_db/converters/drift_converters.dart] 转换。
enum CategoryKind { food, medicine, daily, other }

/// 出库原因（消耗 / 丢弃 / 其他）。
enum OutboundReason { consume, discard, other }

/// 用药类型（药品 / 保健品）。
enum MedicationType { medicine, supplement }

/// 用药频率（每日 N 次 / 特定安排）。
enum Frequency { dailyN, specific }

/// 服药状态（待服 / 已服 / 跳过）。
enum DoseStatus { pending, done, skipped }

/// 通知渠道类型（WxPusher / 群机器人 / 公众号 / 小程序 / 本地日志）。
enum ChannelType { wxpusher, groupBot, oa, miniProgram, localLog }

/// 提醒规则类型。
enum ReminderType { expiry, lowstock, medication, dailyRecipe, custom }

/// 餐别。
enum MealType { breakfast, lunch, dinner, snack }

/// 旅游清单项类型（行李 / 预算）。
enum TravelItemType { luggage, budget }

/// 家庭成员角色。
enum MemberRole { admin, member }
