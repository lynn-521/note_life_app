/// 旅游清单项实体（class-diagram.mermaid · TravelItem）。
///
/// 已补 [SyncEntity]（与 App 端其它同步实体一致，对齐 backend_design §2.3 / §四.2）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'travel_item.freezed.dart';

/// 旅游清单项：行李（数量）或预算（金额），可指派成员认领。
@freezed
class TravelItem with _$TravelItem, SyncEntity {
  const factory TravelItem({
    required String id,
    required String planId,
    @Default(TravelItemType.luggage) TravelItemType type,
    required String name,
    num? qty,
    num? amount,
    @Default(false) bool done,
    String? assignedTo,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _TravelItem;

  factory TravelItem.fromJson(Map<String, dynamic> json) =>
      _$TravelItemFromJson(json);
}
