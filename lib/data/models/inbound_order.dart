/// 入库单实体（class-diagram.mermaid · InboundOrder）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'inbound_order.freezed.dart';

/// 入库事件（append-only）：每次入库写一条 InboundOrder + 一个 StockBatch。
@freezed
class InboundOrder with _$InboundOrder, SyncEntity {
  const factory InboundOrder({
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

  factory InboundOrder.fromJson(Map<String, dynamic> json) =>
      _$InboundOrderFromJson(json);
}
