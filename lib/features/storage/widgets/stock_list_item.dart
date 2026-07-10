/// 库存列表项（商品 + 当前库存 + 低库存徽标）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../features/shared/app_badge.dart';
import '../../../features/shared/app_card.dart';
import '../../../data/models/product.dart';
import '../providers/inventory_providers.dart';

/// 商品库存列表项。
class StockListItem extends ConsumerWidget {
  /// 构造。
  const StockListItem({super.key, required this.product});

  /// 商品。
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final stock = ref.watch(currentStockProvider(product.id));
    final stockVal = stock.when(
      data: (v) => v,
      loading: () => 0,
      error: (_, __) => 0,
    );
    final low = stockVal <= product.lowStockThreshold;
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.surface2,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('📦', style: TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.sans(16, weight: FontWeight.w700)
                      .copyWith(color: theme.textPrimary),
                ),
                if (product.location != null)
                  Text(
                    product.location!,
                    style: AppTextStyles.sans(12, color: theme.textSecondary),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${stockVal.toString()} ${product.unit}',
                style: AppTextStyles.num(18, weight: FontWeight.w800).copyWith(
                  color: low ? theme.dangerInk : theme.textPrimary,
                ),
              ),
              if (low)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: AppBadge(kind: BadgeKind.warning, text: '补货'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
