/// 排菜底部弹层：选餐别 + 选菜谱 + 食材反查提示。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/recipe.dart';
import '../../../features/shared/app_button.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/toast.dart';
import '../providers/dining_providers.dart';

/// 排菜弹层。
class ScheduleSheet extends ConsumerStatefulWidget {
  /// 构造。
  const ScheduleSheet({super.key, this.presetRecipeId});

  /// 预选菜谱（从菜谱卡进入时传入）。
  final String? presetRecipeId;

  @override
  ConsumerState<ScheduleSheet> createState() => _ScheduleSheetState();
}

class _ScheduleSheetState extends ConsumerState<ScheduleSheet> {
  MealType _meal = MealType.breakfast;
  String? _recipeId;

  @override
  void initState() {
    super.initState();
    _recipeId = widget.presetRecipeId;
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final recipes = ref.watch(recipesProvider).valueOrNull ?? const <RecipeModel>[];
    final submitting = ref.watch(scheduleMealNotifier);

    return Container(
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(theme.radiusModal)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.borderStrong,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('排菜到今天',
              style: AppTextStyles.display(20, weight: FontWeight.w700)),
          const SizedBox(height: 16),
          Text('选择餐别',
              style: AppTextStyles.sans(14, weight: FontWeight.w700)
                  .copyWith(color: theme.textSecondary)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: MealType.values
                .map(
                  (t) => GestureDetector(
                    onTap: () => setState(() => _meal = t),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _meal == t ? theme.primarySoft : theme.surface2,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: _meal == t ? theme.primary : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        mealTypeLabel(t),
                        style: AppTextStyles.sans(14, weight: FontWeight.w700)
                            .copyWith(
                          color: _meal == t
                              ? theme.primaryInk
                              : theme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('选择菜谱',
              style: AppTextStyles.sans(14, weight: FontWeight.w700)
                  .copyWith(color: theme.textSecondary)),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: recipes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final r = recipes[i];
                final selected = _recipeId == r.id;
                return GestureDetector(
                  onTap: () => setState(() => _recipeId = r.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: selected ? theme.primarySoft : theme.surface2,
                      borderRadius: BorderRadius.circular(theme.radiusCardSm),
                      border: Border.all(
                        color: selected ? theme.primary : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(r.name,
                              style: AppTextStyles.sans(15, weight: FontWeight.w700)
                                  .copyWith(color: theme.textPrimary)),
                        ),
                        if (selected)
                          Icon(Icons.check_circle,
                              color: theme.primary, size: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            label: submitting ? '排菜中…' : '确认排菜',
            block: true,
            onPressed: submitting ? null : _confirm,
          ),
        ],
      ),
    );
  }

  Future<void> _confirm() async {
    if (_recipeId == null) {
      showAppToast(context, '请先选一道菜');
      return;
    }
    final missing = await ref.read(scheduleMealNotifier.notifier).schedule(
          date: DateTimeX.today,
          mealType: _meal,
          recipeId: _recipeId!,
        );
    if (!mounted) return;
    _showMissing(missing);
  }

  void _showMissing(List<MissingIngredient> missing) {
    final theme = AppTheme.of(context);
    if (missing.isEmpty) {
      showAppToast(context, '已排好，食材齐全 ✅');
      if (mounted) Navigator.of(context).pop();
      return;
    }
    if (!mounted) return;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        content: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('已排好，但还缺这些食材',
                  style: AppTextStyles.sans(16, weight: FontWeight.w800)
                      .copyWith(color: theme.textPrimary)),
              const SizedBox(height: 8),
              Text('（仅提醒，不强制购买）',
                  style: AppTextStyles.sans(12)
                      .copyWith(color: theme.textSecondary)),
              const SizedBox(height: 12),
              ...missing.map(
                (m) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: theme.danger,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${m.name}　还需 ${(m.need - m.have).toString()} ${m.unit ?? ''}（现有 ${m.have.toString()}）',
                          style: AppTextStyles.sans(14)
                              .copyWith(color: theme.textPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: '知道了',
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    if (mounted) Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
