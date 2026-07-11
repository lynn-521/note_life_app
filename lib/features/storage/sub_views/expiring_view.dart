/// 临期 / 补货总览页（system_design §T05）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../shared/empty_state.dart';
import '../../shared/screen_header.dart';
import '../providers/inventory_providers.dart';
import '../widgets/expiring_suggestion_item.dart';

/// 临期 / 需补货全量列表。
class ExpiringView extends ConsumerWidget {
  /// 构造。
  const ExpiringView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final expiring =
        ref.watch(expiringSoonProvider(AppConstants.expiryWarningDays));
    final low = ref.watch(lowStockProvider);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            const ScreenHeader(title: '⏰ 临期 & 补货'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  const _SectionTitle(text: '即将过期（${AppConstants.expiryWarningDays} 天内）'),
                  expiring.when(
                    data: (list) => list.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child:
                                EmptyState(title: '暂无临期', subtitle: '库存都很新鲜～'),
                          )
                        : Column(
                            children: list
                                .map((v) => Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: ExpiringSuggestionItem(view: v),
                                    ))
                                .toList(),
                          ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, __) => Center(child: Text('加载失败: $e')),
                  ),
                  const SizedBox(height: 8),
                  const _SectionTitle(text: '需要补货'),
                  low.when(
                    data: (list) => list.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: EmptyState(
                                title: '库存充足', subtitle: '暂时不需要补货～'),
                          )
                        : Column(
                            children: list
                                .map((v) => Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: ExpiringSuggestionItem(view: v),
                                    ))
                                .toList(),
                          ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, __) => Center(child: Text('加载失败: $e')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: AppTextStyles.sans(15, weight: FontWeight.w800)
            .copyWith(color: theme.textPrimary),
      ),
    );
  }
}
