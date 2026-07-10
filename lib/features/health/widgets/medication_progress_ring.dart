/// 今日服药进度环。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../shared/progress_ring.dart';

/// 今日服药完成度（done / total）。
class MedicationProgressRing extends StatelessWidget {
  /// 构造。
  const MedicationProgressRing({
    super.key,
    required this.done,
    required this.total,
    required this.memberName,
  });

  /// 已完成次数。
  final int done;

  /// 总次数。
  final int total;

  /// 成员名。
  final String memberName;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final progress = total == 0 ? 0.0 : done / total;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(theme.radiusCard),
        boxShadow: [theme.shadows.sm],
      ),
      child: Row(
        children: [
          ProgressRing(
            progress: progress,
            size: 72,
            center: Text(
              '$done/$total',
              style: AppTextStyles.num(18, weight: FontWeight.w800)
                  .copyWith(color: theme.textPrimary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$memberName 今日用药',
                    style: AppTextStyles.sans(16, weight: FontWeight.w700)
                        .copyWith(color: theme.textPrimary)),
                const SizedBox(height: 4),
                Text(
                  total == 0 ? '暂无安排' : '已完成 $done / $total 次',
                  style: AppTextStyles.sans(13, color: theme.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
