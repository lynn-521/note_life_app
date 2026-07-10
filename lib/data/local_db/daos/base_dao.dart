/// DAO 基类 mixin（system_design §2 · base_dao）。
///
/// 提供软删 / 时间戳等通用辅助。各 DAO `with _$XDaoMixin, BaseDao`。
mixin BaseDao {
  /// 当前时间（UTC）。
  DateTime get now => DateTime.now();
}
