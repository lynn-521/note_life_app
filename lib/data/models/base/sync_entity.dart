/// 所有实体的通用字段 mixin（PRD 6.3 / system_design §3.1 / §7.4）。
///
/// 提供统一软删（[deletedAt]）、版本（[version]）与时间戳字段的契约。
/// 所有 21 实体均 `with _$X, SyncEntity`，由 freezed 生成具体实现。
mixin SyncEntity {
  /// 全局唯一主键（带实体前缀，见 [core/utils/id_generator.dart]）。
  String get id;

  /// 创建时间（UTC）。
  DateTime get createdAt;

  /// 更新时间（UTC）。
  DateTime get updatedAt;

  /// 版本号，写时自增，用于字段级 LWW 合并。
  int get version;

  /// 软删时间；非空表示已删除。
  DateTime? get deletedAt;

  /// 是否已软删。
  bool get isDeleted => deletedAt != null;
}
