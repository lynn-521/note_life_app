/// 菜谱库浏览（搜索 + 标签筛选 + 谁会做圆点）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/member.dart';
import '../../../data/models/recipe.dart';
import '../../../features/shared/app_chip.dart';
import '../../../features/shared/empty_state.dart';
import '../../../providers/app_providers.dart';
import '../providers/dining_providers.dart';
import '../widgets/recipe_card.dart';
import '../widgets/schedule_sheet.dart';

/// 菜谱库视图。
class RecipeLibraryView extends ConsumerStatefulWidget {
  /// 构造。
  const RecipeLibraryView({super.key});

  @override
  ConsumerState<RecipeLibraryView> createState() => _RecipeLibraryViewState();
}

class _RecipeLibraryViewState extends ConsumerState<RecipeLibraryView> {
  final TextEditingController _search = TextEditingController();
  String? _tag;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final recipes = ref.watch(recipesProvider).valueOrNull ?? const <Recipe>[];
    final tags = ref.watch(allRecipeTagsProvider);
    final members = ref.watch(membersProvider).valueOrNull ?? const <Member>[];
    final membersById = <String, Member>{
      for (final m in members) m.id: m
    };

    final query = _search.text.trim();
    final filtered = recipes.where((r) {
      final okTag = _tag == null || r.tags.contains(_tag);
      final okQuery = query.isEmpty ||
          r.name.contains(query) ||
          r.tags.any((t) => t.contains(query));
      return okTag && okQuery;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: TextField(
            controller: _search,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: '搜菜名 / 标签',
              prefixIcon: const Icon(Icons.search, size: 20),
              filled: true,
              fillColor: theme.surface2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(theme.radiusInput),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ),
        if (tags.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AppChip(
                    label: '全部',
                    selected: _tag == null,
                    onTap: () => setState(() => _tag = null),
                  ),
                  const SizedBox(width: 8),
                  ...tags.map(
                    (t) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: AppChip(
                        label: t,
                        selected: _tag == t,
                        onTap: () => setState(() => _tag = t),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          child: filtered.isEmpty
              ? const EmptyState(
                  title: '没有匹配的菜谱',
                  subtitle: '换个关键词或标签试试～',
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => RecipeCard(
                    recipe: filtered[i],
                    membersById: membersById,
                    onSchedule: () => _openSchedule(filtered[i].id),
                  ),
                ),
        ),
      ],
    );
  }

  void _openSchedule(String recipeId) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ScheduleSheet(presetRecipeId: recipeId),
    );
  }
}
