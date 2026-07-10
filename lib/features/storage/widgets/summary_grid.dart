/// 库存总览三卡（件数 / 临期 / 补货）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../providers/inventory_providers.dart';

/// 总览三卡。
class SummaryGrid extends ConsumerWidget {
  /// 构造。
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final summary = ref.watch(inventorySummaryProvider);
    return Row(
      children: [
        Expanded(
          child: _Cell(
            icon: '📦',
            label: '商品',
            value: summary.when(
              data: (s) => s.total.toString(),
              loading: () => '…',
              error: (_, __) => '-',
            ),
            bg: theme.primarySoft,
            fg: theme.primaryInk,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _Cell(
            icon: '⏰',
            label: '临期',
            value: summary.when(
              data: (s) => s.expiring.toString(),
              loading: () => '…',
              error: (_, __) => '-',
            ),
            bg: theme.warningSoft,
            fg: theme.warningInk,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _Cell(
            icon: '🛒',
            label: '补货',
            value: summary.when(
              data: (s) => s.lowStock.toString(),
              loading: () => '…',
              error: (_, __) => '-',
            ),
            bg: theme.dangerSoft,
            fg: theme.dangerInk,
          ),
        ),
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.icon,
    required this.label,
    required this.value,
    required this.bg,
    required this.fg,
  });

  final String icon;
  final String label;
  final String value;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(theme.radiusCardSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.num(26, weight: FontWeight.w800).copyWith(color: fg),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.sans(12, weight: FontWeight.w700).copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}
