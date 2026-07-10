/// 旅游行程日卡片。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../data/models/travel_day.dart';
import '../../../features/shared/app_card.dart';

/// 行程日卡片。
class TravelDayCard extends StatelessWidget {
  /// 构造。
  const TravelDayCard({super.key, required this.day, required this.onEdit});

  /// 行程日。
  final TravelDay day;

  /// 编辑回调。
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: theme.skySoft,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('${day.dayIndex}',
                      style: AppTextStyles.num(14, weight: FontWeight.w800)
                          .copyWith(color: theme.skyInk)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(day.date.zhLong,
                    style: AppTextStyles.sans(13, weight: FontWeight.w700)
                        .copyWith(color: theme.textSecondary)),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: theme.surface2,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('✎',
                        style: TextStyle(fontSize: 14, color: theme.textTertiary)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            day.agenda.isEmpty ? '（暂无安排）' : day.agenda,
            style: AppTextStyles.sans(14)
                .copyWith(color: day.agenda.isEmpty
                    ? theme.textTertiary
                    : theme.textPrimary),
          ),
        ],
      ),
    );
  }
}
