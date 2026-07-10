/// 单次服药列表项（待服 / 已服 / 跳过）。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/stock_view.dart';
import '../../shared/app_badge.dart';
import '../../shared/app_card.dart';

/// 今日某次服药项。
class DoseListItem extends StatelessWidget {
  /// 构造。
  const DoseListItem({
    super.key,
    required this.dose,
    required this.onDone,
    required this.onSkip,
  });

  /// 本次服药视图。
  final DoseToday dose;

  /// 标记已服。
  final VoidCallback onDone;

  /// 标记跳过。
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final med = dose.medication;
    final done = dose.status == DoseStatus.done;
    final skipped = dose.status == DoseStatus.skipped;
    final time = dose.scheduledTime.hhmm;
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: done ? theme.successSoft : theme.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(done ? '✅' : '💊',
                  style: const TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(med.name,
                    style: AppTextStyles.sans(16, weight: FontWeight.w700)
                        .copyWith(color: theme.textPrimary)),
                Text('$time · ${med.dosage}',
                    style: AppTextStyles.sans(13, color: theme.textSecondary)),
              ],
            ),
          ),
          if (done)
            const AppBadge(kind: BadgeKind.success, text: '已服')
          else if (skipped)
            const AppBadge(kind: BadgeKind.info, text: '跳过')
          else
            Row(
              children: [
                GestureDetector(
                  onTap: onSkip,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.surface2,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('跳过',
                        style: AppTextStyles.sans(13, weight: FontWeight.w700)
                            .copyWith(color: theme.textSecondary)),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onDone,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.primary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('服药',
                        style: AppTextStyles.sans(13, weight: FontWeight.w700)
                            .copyWith(color: theme.textPrimary)),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
