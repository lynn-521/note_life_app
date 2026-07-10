/// 旅游计划书列表项。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_plan.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';

/// 旅游计划书项。
class TravelListItem extends StatelessWidget {
  /// 构造。
  const TravelListItem({
    super.key,
    required this.plan,
    required this.membersById,
    required this.onTap,
  });

  /// 计划书。
  final TravelPlan plan;

  /// 成员映射。
  final Map<String, Member> membersById;

  /// 点击进入详情。
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final participants = plan.memberIds
        .where((id) => membersById.containsKey(id))
        .toList();
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: theme.skySoft,
              shape: BoxShape.circle,
            ),
            child: const Center(
                child: Text('🧳', style: TextStyle(fontSize: 22))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan.title,
                    style: AppTextStyles.sans(16, weight: FontWeight.w800)
                        .copyWith(color: theme.textPrimary)),
                const SizedBox(height: 4),
                Text(
                  '${plan.start.zhLong} → ${plan.end.zhLong}',
                  style: AppTextStyles.sans(12)
                      .copyWith(color: theme.textSecondary),
                ),
              ],
            ),
          ),
          if (participants.isNotEmpty)
            Row(
              children: participants
                  .map((id) {
                    final m = membersById[id]!;
                    return Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: AvatarDot(
                        color: Color(m.color),
                        label: m.name.isNotEmpty ? m.name[0] : '?',
                        size: 24,
                      ),
                    );
                  })
                  .toList(),
            ),
        ],
      ),
    );
  }
}
