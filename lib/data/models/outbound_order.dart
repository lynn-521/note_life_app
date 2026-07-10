/// 出库单实体（class-diagram.mermaid · OutboundOrder）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'outbound_order.freezed.dart';

/// 出库事件（append-only）：消耗 / 丢弃等扣减库存。
@freezed
class OutboundOrder with _$OutboundOrder, SyncEntity {
  const factory OutboundOrder({
    required String id,
    required String productId,
    required num qty,
    @Default(OutboundReason.consume) OutboundReason reason,
    required String operatorId,
    required DateTime at,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _OutboundOrder;

  factory OutboundOrder.fromJson(Map<String, dynamic> json) =>
      _$OutboundOrderFromJson(json);
}
