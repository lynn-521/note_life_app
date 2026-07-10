/// 商品分类实体（class-diagram.mermaid · Category）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'category.freezed.dart';

/// 商品分类：食品 / 药品 / 日用品 / 其他。
@freezed
class Category with _$Category, SyncEntity {
  const factory Category({
    required String id,
    required String name,
    @Default(CategoryKind.other) CategoryKind kind,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
