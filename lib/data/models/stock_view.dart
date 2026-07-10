/// 库存聚合视图（非实体，供 UI 展示）。
///
/// 由 [InventoryRepository.expiringSoon] / [InventoryRepository.lowStock]
/// 聚合产生：携带商品、批次、当前库存、剩余天数。
import 'enums.dart';
import 'medication.dart';
import 'product.dart';
import 'stock_batch.dart';

/// 库存视图：商品 + 批次 + 当前库存 + 距过期天数（低库存为 null）。
class StockView {
  /// 构造。
  const StockView({
    required this.product,
    this.batch,
    required this.currentStock,
    this.daysLeft,
  });

  /// 商品。
  final Product product;

  /// 命中批次（临期场景下的具体批次；低库存可能为 null）。
  final StockBatch? batch;

  /// 当前库存（Σ入库 − Σ出库）。
  final num currentStock;

  /// 距过期天数（临期场景；低库存为 null）。
  final int? daysLeft;

  @override
  String toString() =>
      'StockView(product=${product.name}, stock=$currentStock, daysLeft=$daysLeft)';
}

/// 今日待服视图（健康模块用）。
class DoseToday {
  /// 构造。
  const DoseToday({
    required this.medication,
    required this.scheduledTime,
    required this.logId,
    required this.status,
  });

  /// 用药计划。
  final Medication medication;

  /// 计划服药时刻（今天）。
  final DateTime scheduledTime;

  /// 对应 DoseLog 的稳定 id。
  final String logId;

  /// 当前打卡状态。
  final DoseStatus status;
}
