/// 入库单实体（class-diagram.mermaid · InboundOrderModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'inbound_order.freezed.dart';

/// 入库事件（append-only）：每次入库写一条 InboundOrderModel + 一个 StockBatchModel。
@freezed
class InboundOrderModel with _$InboundOrderModel, SyncEntity {
  const factory InboundOrderModel({
    required String id,
    required String productId,
    required num qty,
    required String operatorId,
    required DateTime at,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _InboundOrder;

  factory InboundOrderModel.fromJson(Map<String, dynamic> json) =>
      _$InboundOrderModelFromJson(json);
}
