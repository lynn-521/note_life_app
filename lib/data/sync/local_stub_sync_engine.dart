/// LocalStubSyncEngine（system_design §1.7 · 无操作桩）。
///
/// 首版不接真实后端：push 返回成功空操作，pull 返回空。
/// TODO(接入): 替换为 CloudBase / Supabase 实时同步，并更新 lastSyncAt。
import '../models/base/sync_entity.dart';
import 'sync_engine.dart';

/// 本地桩同步引擎。
class LocalStubSyncEngine implements SyncEngine {
  /// 构造。
  const LocalStubSyncEngine();

  @override
  Future<SyncResult> push(List<SyncEntity> changes) async => SyncResult(
        success: true,
        syncedAt: DateTime.now(),
        count: changes.length,
      );

  @override
  Future<List<SyncEntity>> pull(DateTime since) async => <SyncEntity>[];
}
