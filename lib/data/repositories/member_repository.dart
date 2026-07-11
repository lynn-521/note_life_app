/// MemberRepository（class-diagram.mermaid · MemberRepository）。
library;
import '../models/member.dart';
import '../local_db/app_database.dart';

/// 家庭成员仓储接口。
abstract class MemberRepository {
  /// 获取全部未删除成员。
  Future<List<MemberModel>> getAll();

  /// 监听全部未删除成员。
  Stream<List<MemberModel>> watchAll();

  /// 按 id 获取。
  Future<MemberModel?> getById(String id);

  /// 保存（upsert）。
  Future<void> save(MemberModel member);

  /// 软删。
  Future<void> delete(String id);
}

/// 基于 Drift 的实现。
class MemberRepositoryImpl implements MemberRepository {
  /// 构造。
  MemberRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<List<MemberModel>> getAll() => db.memberDao.getAll();

  @override
  Stream<List<MemberModel>> watchAll() => db.memberDao.watchAll();

  @override
  Future<MemberModel?> getById(String id) => db.memberDao.getById(id);

  @override
  Future<void> save(MemberModel member) => db.memberDao.save(member);

  @override
  Future<void> delete(String id) => db.memberDao.softDelete(id);
}
