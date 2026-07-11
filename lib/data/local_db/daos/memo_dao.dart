/// MemoDao（class-diagram.mermaid · MemoDao）。
library;
import 'package:drift/drift.dart';

import '../../models/memo.dart';
import '../tables/memo_table.dart';
import 'base_dao.dart';
import '../app_database.dart';
part 'memo_dao.g.dart';

/// 备忘录数据访问。
@DriftAccessor(tables: [Memos])
class MemoDao extends DatabaseAccessor<AppDatabase>
    with _$MemoDaoMixin, BaseDao {
  /// 构造。
  MemoDao(super.db);

  /// 监听全部未删除备忘录（置顶优先、未完成优先、新近优先）。
  Stream<List<MemoModel>> watchAll() =>
      (select(memos)
            ..where((t) => t.deletedAt.isNull())
            ..orderBy([
              (t) => OrderingTerm.desc(t.pinned),
              (t) => OrderingTerm.asc(t.done),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .watch()
          .map((rows) => rows.map(_toModel).toList());

  /// 获取全部未删除备忘录。
  Future<List<MemoModel>> getAll() async =>
      (await (select(memos)
            ..where((t) => t.deletedAt.isNull())
            ..orderBy([
              (t) => OrderingTerm.desc(t.pinned),
              (t) => OrderingTerm.asc(t.done),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .get())
          .map(_toModel)
          .toList();

  /// 获取全部备忘录（含软删，供同步推送使用）。
  Future<List<MemoModel>> getAllForSync() async =>
      (await select(memos).get()).map(_toModel).toList();

  /// 按 id 获取。
  Future<MemoModel?> getById(String id) async {
    final row = await (select(memos)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toModel(row);
  }

  /// 保存（upsert）。
  Future<void> saveMemo(MemoModel m) =>
      into(memos).insertOnConflictUpdate(_toCompanion(m));

  /// 软删。
  Future<void> softDeleteMemo(String id) =>
      (update(memos)..where((t) => t.id.equals(id)))
          .write(MemosCompanion(deletedAt: Value(now)));

  MemoModel _toModel(Memo r) => MemoModel(
        id: r.id,
        title: r.title,
        body: r.body,
        authorId: r.authorId,
        pinned: r.pinned,
        done: r.done,
        dueAt: r.dueAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  MemosCompanion _toCompanion(MemoModel m) => MemosCompanion(
        id: Value(m.id),
        title: Value(m.title),
        body: Value(m.body),
        authorId: Value(m.authorId),
        pinned: Value(m.pinned),
        done: Value(m.done),
        dueAt: Value(m.dueAt),
        createdAt: Value(m.createdAt),
        updatedAt: Value(m.updatedAt),
        version: Value(m.version),
        deletedAt: Value(m.deletedAt),
      );
}
