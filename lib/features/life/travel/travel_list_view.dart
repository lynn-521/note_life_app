/// 旅游计划书列表（计划头 + 参与成员圆点）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_plan.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';
import '../../../features/shared/empty_state.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';
import 'travel_detail_view.dart';
import 'travel_list_item.dart';

/// 旅游计划书列表视图。
class TravelListView extends ConsumerWidget {
  /// 构造。
  const TravelListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final plans = ref.watch(travelPlansProvider);
    final members = ref.watch(membersProvider).valueOrNull ?? const <Member>[];
    final membersById = <String, Member>{
      for (final m in members) m.id: m
    };
    return plans.when(
      data: (list) => list.isEmpty
          ? const EmptyState(
              title: '还没有旅行计划',
              subtitle: '点右上角 ➕ 规划一次出行吧～',
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => TravelListItem(
                plan: list[i],
                membersById: membersById,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TravelDetailView(planId: list[i].id),
                  ),
                ),
              ),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('加载失败: $e')),
    );
  }
}
