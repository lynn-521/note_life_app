/// 今日菜单（按餐别排菜 + 移除）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../data/models/daily_meal.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/member.dart';
import '../../../data/models/recipe.dart';
import '../../../features/shared/app_button.dart';
import '../../../providers/app_providers.dart';
import '../providers/dining_providers.dart';
import '../widgets/meal_section.dart';
import '../widgets/schedule_sheet.dart';

/// 今日菜单视图。
class TodayMenuView extends ConsumerWidget {
  /// 构造。
  const TodayMenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final today = DateTimeX.today;
    final mealsAsync = ref.watch(todayMealsProvider(today));
    final recipesAsync = ref.watch(recipesProvider);
    final membersAsync = ref.watch(membersProvider);

    final recipeMap = <String, RecipeModel>{
      for (final r in recipesAsync.valueOrNull ?? const <RecipeModel>[]) r.id: r
    };
    final membersById = <String, MemberModel>{
      for (final m in membersAsync.valueOrNull ?? const <MemberModel>[]) m.id: m
    };

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Row(
            children: [
              Text(
                '今天 · ${today.zhShort}',
                style: AppTextStyles.sans(14, weight: FontWeight.w800)
                    .copyWith(color: theme.textSecondary),
              ),
              const Spacer(),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '排菜',
                small: true,
                onPressed: () => _openSchedule(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: mealsAsync.when(
            data: (meals) {
              final byMeal = <MealType, List<DailyMealModel>>{
                for (final t in MealType.values)
                  t: meals.where((m) => m.mealType == t).toList()
              };
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: MealType.values.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final t = MealType.values[i];
                  return MealSection(
                    mealType: t,
                    meals: byMeal[t]!,
                    recipeMap: recipeMap,
                    membersById: membersById,
                    onRemove: (id) async {
                      await ref
                          .read(repositoriesProvider)
                          .recipe
                          .removeDailyMeal(id);
                      ref.invalidate(todayMealsProvider(today));
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, __) => Center(child: Text('加载失败: $e')),
          ),
        ),
      ],
    );
  }

  void _openSchedule(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ScheduleSheet(),
    );
  }
}
