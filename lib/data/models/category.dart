/// 商品分类实体（class-diagram.mermaid · CategoryModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// 商品分类：食品 / 药品 / 日用品 / 其他。
@freezed
class CategoryModel with _$CategoryModel, SyncEntity {
  const factory CategoryModel({
    required String id,
    required String name,
    @Default(CategoryKind.other) CategoryKind kind,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Category;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
