/// ReminderEngine 抽象（system_design §1.6 / class-diagram.mermaid）。
import '../models/memo.dart';

/// 提醒引擎抽象：本地定时扫描 + 用药到点调度。
abstract class ReminderEngine {
  /// 初始化（通知权限 / 后台任务）。
  Future<void> init();

  /// 为某成员排程当日用药提醒。
  Future<void> scheduleDoseReminders(String memberId);

  /// 扫描启用的规则并计算命中，经 dispatcher 下发（App 启动 / 数据变更后调用）。
  Future<void> scanAndFireRules();

  /// 为带到期时间的备忘录排程本地提醒。
  Future<void> scheduleMemoReminder(Memo memo);
}
