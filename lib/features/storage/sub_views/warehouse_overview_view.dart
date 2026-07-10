/// 仓库总览：三卡 + 筛选（全部 / 临期 / 补货）+ 列表。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extension.dart';
import '../../../features/shared/app_chip.dart';
import '../../../features/shared/empty_state.dart';
import '../providers/inventory_providers.dart';
import '../widgets/expiring_suggestion_item.dart';
import '../widgets/stock_list_item.dart';
import '../widgets/summary_grid.dart';

/// 仓库总览视图。
class WarehouseOverviewView extends ConsumerStatefulWidget {
  /// 构造。
  const WarehouseOverviewView({super.key});

  @override
  ConsumerState<WarehouseOverviewView> createState() =>
      _WarehouseOverviewViewState();
}

class _WarehouseOverviewViewState extends ConsumerState<WarehouseOverviewView> {
  String _tab = '全部';

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: const SummaryGrid(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppChipGroup(
            options: const ['全部', '临期', '补货'],
            selected: _tab,
            onSelected: (v) => setState(() => _tab = v),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(child: _buildList(ref, _tab, theme)),
      ],
    );
  }

  Widget _buildList(WidgetRef ref, String tab, dynamic theme) {
    if (tab == '临期') {
      final expiring =
          ref.watch(expiringSoonProvider(AppConstants.expiryWarningDays));
      return expiring.when(
        data: (list) => list.isEmpty
            ? const EmptyState(title: '暂无临期', subtitle: '库存都很新鲜，放心～')
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) => ExpiringSuggestionItem(view: list[i]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) => Center(child: Text('加载失败: $e')),
      );
    }
    if (tab == '补货') {
      final low = ref.watch(lowStockProvider);
      return low.when(
        data: (list) => list.isEmpty
            ? const EmptyState(title: '库存充足', subtitle: '暂时不需要补货～')
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) => ExpiringSuggestionItem(view: list[i]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, __) => Center(child: Text('加载失败: $e')),
      );
    }
    final products = ref.watch(productsProvider);
    return products.when(
      data: (list) => list.isEmpty
          ? const EmptyState(title: '仓库空空', subtitle: '去入库囤点好物吧～')
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => StockListItem(product: list[i]),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('加载失败: $e')),
    );
  }
}
