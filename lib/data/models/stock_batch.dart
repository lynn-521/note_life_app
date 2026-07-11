/// 库存批次实体（class-diagram.mermaid · StockBatchModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'stock_batch.freezed.dart';
part 'stock_batch.g.dart';

/// 入库批次：同一商品一次入库形成一个批次，承载数量与有效期。
@freezed
class StockBatchModel with _$StockBatchModel, SyncEntity {
  const factory StockBatchModel({
    required String id,
    required String productId,
    required num quantity,
    DateTime? expireDate,
    String? batchNo,
    required DateTime inboundAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _StockBatch;

  factory StockBatchModel.fromJson(Map<String, dynamic> json) =>
      _$StockBatchModelFromJson(json);
}
