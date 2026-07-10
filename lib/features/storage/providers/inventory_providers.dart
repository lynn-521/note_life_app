/// 仓库模块 Provider（system_design §1.4）。
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/state/async_state.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/stock_view.dart';
import '../../../providers/app_providers.dart';

/// 库存总览三卡数据。
class InventorySummary {
  /// 构造。
  const InventorySummary({
    required this.total,
    required this.expiring,
    required this.lowStock,
  });

  /// 商品数。
  final int total;

  /// 临期数。
  final int expiring;

  /// 需补货数。
  final int lowStock;
}

/// 总览三卡（件数 / 临期 / 补货）。
final inventorySummaryProvider = FutureProvider<InventorySummary>((ref) async {
  final inv = ref.watch(repositoriesProvider).inventory;
  final products = await inv.getProducts();
  final expiring = await inv.expiringSoon(AppConstants.expiryWarningDays);
  final low = await inv.lowStock();
  return InventorySummary(
    total: products.length,
    expiring: expiring.length,
    lowStock: low.length,
  );
});

/// 商品流。
final productsProvider =
    StreamProvider((ref) => ref.watch(repositoriesProvider).product.watchProducts());

/// 分类流。
final categoriesProvider =
    StreamProvider((ref) => ref.watch(repositoriesProvider).product.watchCategories());

/// 临期视图。
final expiringSoonProvider =
    FutureProvider.family<List<StockView>, int>((ref, days) {
  return ref.watch(repositoriesProvider).inventory.expiringSoon(days);
});

/// 低库存视图。
final lowStockProvider =
    FutureProvider((ref) => ref.watch(repositoriesProvider).inventory.lowStock());

/// 单商品当前库存。
final currentStockProvider =
    FutureProvider.family<num, String>((ref, productId) {
  return ref.watch(repositoriesProvider).inventory.currentStock(productId);
});

/// 入库表单 Notifier（提交 → 写事件 → 触发扫描）。
final inboundFormNotifier =
    NotifierProvider<InboundFormNotifier, AsyncState<bool>>(
  InboundFormNotifier.new,
);

/// 入库表单动作。
class InboundFormNotifier extends Notifier<AsyncState<bool>> {
  @override
  AsyncState<bool> build() => const AsyncState.idle();

  /// 提交入库。
  Future<void> submit({
    required String productId,
    required num qty,
    required String operatorId,
    DateTime? expireDate,
    String? note,
  }) async {
    state = const AsyncState.loading();
    try {
      final inv = ref.read(repositoriesProvider).inventory;
      await inv.recordInbound(
        productId: productId,
        qty: qty,
        operatorId: operatorId,
        expireDate: expireDate,
        note: note,
      );
      await ref.read(reminderEngineProvider).scanAndFireRules();
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }
}
