/// SyncEngine 抽象（system_design §1.7 / class-diagram.mermaid）。
library;
import '../models/base/sync_entity.dart';

/// 同步结果。
class SyncResult {
  /// 构造。
  const SyncResult({
    required this.success,
    required this.syncedAt,
    this.count = 0,
  });

  /// 是否成功。
  final bool success;

  /// 同步时间。
  final DateTime syncedAt;

  /// 同步变更数。
  final int count;
}

/// 云端同步引擎抽象（首版为桩，后续替换为 CloudBase / Supabase）。
abstract class SyncEngine {
  /// 推送本地变更。
  Future<SyncResult> push(List<SyncEntity> changes);

  /// 拉取自某时刻以来的远端变更。
  Future<List<SyncEntity>> pull(DateTime since);
}
