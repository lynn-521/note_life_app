/// 商品实体（class-diagram.mermaid · Product）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'product.freezed.dart';

/// 商品（库内一类物资，如「牛奶」「布洛芬」）。
///
/// 库存 = Σ入库 − Σ出库（事件溯源，见 [InventoryRepository]）。
@freezed
class Product with _$Product, SyncEntity {
  const factory Product({
    required String id,
    required String name,
    required String categoryId,
    required String unit,
    String? barcode,
    String? location,
    @Default(1) int lowStockThreshold,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
