/// 出库单实体（class-diagram.mermaid · OutboundOrderModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'outbound_order.freezed.dart';

/// 出库事件（append-only）：消耗 / 丢弃等扣减库存。
@freezed
class OutboundOrderModel with _$OutboundOrderModel, SyncEntity {
  const factory OutboundOrderModel({
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

  factory OutboundOrderModel.fromJson(Map<String, dynamic> json) =>
      _$OutboundOrderModelFromJson(json);
}
