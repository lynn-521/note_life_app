/// 今日菜单某餐别分区。
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/daily_meal.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/member.dart';
import '../../../data/models/recipe.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';
import '../providers/dining_providers.dart';

/// 餐别分区卡片。
class MealSection extends StatelessWidget {
  /// 构造。
  const MealSection({
    super.key,
    required this.mealType,
    required this.meals,
    required this.recipeMap,
    required this.membersById,
    required this.onRemove,
  });

  /// 餐别。
  final MealType mealType;

  /// 该餐别已排的菜。
  final List<DailyMeal> meals;

  /// 菜谱映射（recipeId → Recipe）。
  final Map<String, Recipe> recipeMap;

  /// 成员映射。
  final Map<String, Member> membersById;

  /// 移除排菜。
  final ValueChanged<String> onRemove;

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
                  color: theme.primarySoft,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(_mealEmoji(mealType),
                      style: const TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                mealTypeLabel(mealType),
                style: AppTextStyles.sans(16, weight: FontWeight.w800)
                    .copyWith(color: theme.textPrimary),
              ),
              const Spacer(),
              Text(
                '${meals.length} 道',
                style: AppTextStyles.sans(12, weight: FontWeight.w700)
                    .copyWith(color: theme.textTertiary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (meals.isEmpty)
            Text(
              '还没排菜～',
              style: AppTextStyles.sans(13)
                  .copyWith(color: theme.textTertiary),
            )
          else
            ...meals.map((m) {
              final recipe = recipeMap[m.recipeId];
              final name = recipe?.name ?? '未知菜谱';
              final tags = recipe?.tags ?? const <String>[];
              final cooks = (recipe?.cookableBy ?? const <String>[])
                  .where((id) => membersById.containsKey(id))
                  .toList();
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: AppTextStyles.sans(15, weight: FontWeight.w700)
                                .copyWith(color: theme.textPrimary),
                          ),
                          if (tags.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Wrap(
                                spacing: 6,
                                children: tags
                                    .map(
                                      (t) => Text(
                                        '#$t',
                                        style: AppTextStyles.sans(12)
                                            .copyWith(color: theme.textSecondary),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          if (cooks.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Wrap(
                                spacing: 6,
                                children: cooks
                                    .map((id) {
                                      final mem = membersById[id]!;
                                      return AvatarDot(
                                        color: Color(mem.color),
                                        label: mem.name.isNotEmpty
                                            ? mem.name[0]
                                            : '?',
                                        size: 22,
                                      );
                                    })
                                    .toList()
                                  ..add(const SizedBox(width: 4)),
                              ),
                            ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => onRemove(m.id),
                      child: Container(
                        width: 28,
                        height: 28,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: theme.surface2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text('✕',
                              style: TextStyle(
                                  fontSize: 14, color: theme.textTertiary)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }

  String _mealEmoji(MealType type) {
    switch (type) {
      case MealType.breakfast:
        return '🌅';
      case MealType.lunch:
        return '☀️';
      case MealType.dinner:
        return '🌙';
      case MealType.snack:
        return '🍎';
    }
  }
}
