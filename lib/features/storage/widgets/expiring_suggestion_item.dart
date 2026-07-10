/// 临期 / 补货建议项（StockView）。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../features/shared/app_badge.dart';
import '../../../features/shared/app_card.dart';
import '../../../data/models/stock_view.dart';

/// 临期 / 补货建议卡片。
class ExpiringSuggestionItem extends StatelessWidget {
  /// 构造。
  const ExpiringSuggestionItem({super.key, required this.view});

  /// 库存视图。
  final StockView view;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final isExpiring = view.daysLeft != null;
    final daysLeft = view.daysLeft ?? 0;
    final urgent = isExpiring && daysLeft <= 1;
    final badgeKind = isExpiring ? BadgeKind.danger : BadgeKind.warning;
    final badgeText = isExpiring ? '$daysLeft 天过期' : '库存偏低';
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isExpiring ? theme.dangerSoft : theme.warningSoft,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isExpiring ? '⏰' : '🛒',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  view.product.name,
                  style: AppTextStyles.sans(16, weight: FontWeight.w700)
                      .copyWith(color: theme.textPrimary),
                ),
                Text(
                  '当前库存 ${view.currentStock.toString()} ${view.product.unit}',
                  style: AppTextStyles.sans(12, color: theme.textSecondary),
                ),
              ],
            ),
          ),
          AppBadge(
            kind: badgeKind,
            text: badgeText,
            bounce: urgent,
          ),
        ],
      ),
    );
  }
}
