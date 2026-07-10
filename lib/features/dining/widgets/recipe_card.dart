/// 菜谱卡片（菜名 / 标签 / 谁会做圆点 / 排菜）。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/member.dart';
import '../../../data/models/recipe.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';

/// 菜谱卡片。
class RecipeCard extends StatelessWidget {
  /// 构造。
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.membersById,
    required this.onSchedule,
  });

  /// 菜谱。
  final Recipe recipe;

  /// 成员映射（id → Member），用于「谁会做」圆点。
  final Map<String, Member> membersById;

  /// 排菜回调。
  final VoidCallback onSchedule;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final cooks = recipe.cookableBy
        .where((id) => membersById.containsKey(id))
        .toList();
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  recipe.name,
                  style: AppTextStyles.sans(18, weight: FontWeight.w800)
                      .copyWith(color: theme.textPrimary),
                ),
              ),
              GestureDetector(
                onTap: onSchedule,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.primary,
                    borderRadius: BorderRadius.circular(theme.radiusButton),
                  ),
                  child: Text(
                    '排菜',
                    style: AppTextStyles.sans(13, weight: FontWeight.w800)
                        .copyWith(color: theme.textPrimary),
                  ),
                ),
              ),
            ],
          ),
          if (recipe.tags.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: recipe.tags
                  .map(
                    (t) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.surface2,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        t,
                        style: AppTextStyles.sans(12, weight: FontWeight.w700)
                            .copyWith(color: theme.textSecondary),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '谁会做',
                style: AppTextStyles.sans(12, weight: FontWeight.w700)
                    .copyWith(color: theme.textTertiary),
              ),
              const SizedBox(width: 10),
              if (cooks.isEmpty)
                Text(
                  '未指定',
                  style: AppTextStyles.sans(12)
                      .copyWith(color: theme.textTertiary),
                )
              else
                ...cooks.map((id) {
                  final m = membersById[id]!;
                  final initial = m.name.isNotEmpty ? m.name[0] : '?';
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AvatarDot(
                          color: Color(m.color),
                          label: initial,
                          size: 28,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          m.name,
                          style: AppTextStyles.sans(12, weight: FontWeight.w700)
                              .copyWith(color: theme.textSecondary),
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        ],
      ),
    );
  }
}
