/// MemoRepository（class-diagram.mermaid · MemoRepository）。
library;
import '../models/memo.dart';
import '../local_db/app_database.dart';

/// 备忘录仓储接口。
abstract class MemoRepository {
  /// 监听全部备忘录。
  Stream<List<MemoModel>> watchAll();

  /// 获取全部备忘录。
  Future<List<MemoModel>> getAll();

  /// 按 id 获取。
  Future<MemoModel?> getById(String id);

  /// 保存（upsert）。
  Future<void> saveMemo(MemoModel memo);

  /// 软删。
  Future<void> deleteMemo(String id);
}

/// 基于 Drift 的实现。
class MemoRepositoryImpl implements MemoRepository {
  /// 构造。
  MemoRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Stream<List<MemoModel>> watchAll() => db.memoDao.watchAll();

  @override
  Future<List<MemoModel>> getAll() => db.memoDao.getAll();

  @override
  Future<MemoModel?> getById(String id) => db.memoDao.getById(id);

  @override
  Future<void> saveMemo(MemoModel memo) => db.memoDao.saveMemo(memo);

  @override
  Future<void> deleteMemo(String id) => db.memoDao.softDeleteMemo(id);
}
