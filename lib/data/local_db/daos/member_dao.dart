/// MemberDao（class-diagram.mermaid · MemberDao）。
import 'package:drift/drift.dart';

import '../../models/member.dart';
import '../tables/member_table.dart';
import 'base_dao.dart';
import '../app_database.dart' show AppDatabase;
part 'member_dao.drift.dart';

/// 家庭成员数据访问。
@DriftAccessor(tables: [Members])
class MemberDao extends DatabaseAccessor<AppDatabase>
    with _$MemberDaoMixin, BaseDao {
  /// 构造。
  MemberDao(super.db);

  /// 监听全部未删除成员。
  Stream<List<Member>> watchAll() =>
      (select(members)..where((t) => t.deletedAt.isNull()))
          .watch()
          .map((rows) => rows.map(_toModel).toList());

  /// 获取全部未删除成员。
  Future<List<Member>> getAll() async =>
      (await (select(members)..where((t) => t.deletedAt.isNull())).get())
          .map(_toModel)
          .toList();

  /// 获取全部成员（含软删，供同步推送使用，确保删除能传播到远端）。
  Future<List<Member>> getAllForSync() async =>
      (await select(members).get()).map(_toModel).toList();

  /// 按 id 获取成员。
  Future<Member?> getById(String id) async {
    final row = await (select(members)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toModel(row);
  }

  /// 保存（upsert）。
  Future<void> save(Member m) =>
      into(members).insertOnConflictUpdate(_toCompanion(m));

  /// 软删。
  Future<void> softDelete(String id) =>
      (update(members)..where((t) => t.id.equals(id)))
          .write(MembersCompanion(deletedAt: Value(now)));

  MembersCompanion _toCompanion(Member m) => MembersCompanion.insert(
        id: Value(m.id),
        name: Value(m.name),
        avatar: Value(m.avatar),
        role: Value(m.role),
        wxUid: Value(m.wxUid),
        color: Value(m.color),
        createdAt: Value(m.createdAt),
        updatedAt: Value(m.updatedAt),
        version: Value(m.version),
        deletedAt: Value(m.deletedAt),
      );

  Member _toModel(MemberRow r) => Member(
        id: r.id,
        name: r.name,
        avatar: r.avatar,
        role: r.role,
        wxUid: r.wxUid,
        color: r.color,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );
}
