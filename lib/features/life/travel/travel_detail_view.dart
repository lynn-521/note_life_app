/// 旅游计划书详情（每日行程 / 行李清单 / 预算）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_day.dart';
import '../../../data/models/travel_item.dart';
import '../../../data/models/travel_plan.dart';
import '../../../features/shared/app_button.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';
import '../../../features/shared/empty_state.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';
import 'travel_day_card.dart';
import 'travel_form_sheet.dart';
import 'travel_item_row.dart';
import 'travel_item_sheet.dart';

/// 旅游计划书详情页。
class TravelDetailView extends ConsumerWidget {
  /// 构造。
  const TravelDetailView({super.key, required this.planId});

  /// 计划书 id。
  final String planId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final plans = ref.watch(travelPlansProvider);
    final days = ref.watch(travelDaysProvider(planId));
    final items = ref.watch(travelItemsProvider(planId));
    final members = ref.watch(membersProvider).valueOrNull ?? const <Member>[];
    final membersById = <String, Member>{
      for (final m in members) m.id: m
    };

    TravelPlan? plan;
    final matched =
        plans.valueOrNull?.where((p) => p.id == planId).toList() ?? [];
    if (matched.isNotEmpty) plan = matched.first;

    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: plans.when(
          data: (_) => plan == null
              ? const EmptyState(title: '计划不存在', subtitle: '可能已被删除')
              : _buildBody(
                  context, ref, theme, plan, days, items, membersById),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Center(child: Text('加载失败: $e')),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    AppTheme theme,
    TravelPlan plan,
    AsyncValue<List<TravelDay>> days,
    AsyncValue<List<TravelItem>> items,
    Map<String, Member> membersById,
  ) {
    final luggage = items.valueOrNull
            ?.where((i) => i.type == TravelItemType.luggage)
            .toList() ??
        const <TravelItem>[];
    final budget = items.valueOrNull
            ?.where((i) => i.type == TravelItemType.budget)
            .toList() ??
        const <TravelItem>[];
    final total = budget.fold<num>(0, (s, i) => s + (i.amount ?? 0));

    return Column(
      children: [
        _Header(
          plan: plan,
          membersById: membersById,
          onEdit: () => _editPlan(context, plan),
          onBack: () => Navigator.of(context).pop(),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            children: [
              AppCard(
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: theme.sunSoft,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Text('💰', style: TextStyle(fontSize: 22))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('预算合计',
                              style: AppTextStyles.sans(13, weight: FontWeight.w700)
                                  .copyWith(color: theme.textSecondary)),
                          Text('¥${total.toStringAsFixed(0)}',
                              style: AppTextStyles.num(24, weight: FontWeight.w800)
                                  .copyWith(color: theme.sunInk)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _SectionTitle(text: '每日行程'),
              days.when(
                data: (list) => list.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: EmptyState(
                            title: '还没有行程', subtitle: '点下方添加每日安排'),
                      )
                    : Column(
                        children: list
                            .map(
                              (d) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: TravelDayCard(
                                  day: d,
                                  onEdit: () => _editAgenda(context, ref, d),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, __) => Center(child: Text('加载失败: $e')),
              ),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '＋ 添加一天',
                block: true,
                onPressed: () => _addDay(context, ref, plan.id),
              ),
              const SizedBox(height: 16),
              _SectionTitle(text: '行李清单'),
              luggage.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: EmptyState(
                          title: '空空如也', subtitle: '添加要带的行李吧'),
                    )
                  : Column(
                      children: luggage
                          .map(
                            (i) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TravelItemRow(
                                item: i,
                                membersById: membersById,
                                onChanged: () => _refresh(ref),
                              ),
                            ),
                          )
                          .toList(),
                    ),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '＋ 添加行李',
                block: true,
                onPressed: () =>
                    _addItem(context, ref, plan.id, TravelItemType.luggage),
              ),
              const SizedBox(height: 16),
              _SectionTitle(text: '预算项'),
              budget.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: EmptyState(
                          title: '暂无预算', subtitle: '添加交通 / 住宿等花费'),
                    )
                  : Column(
                      children: budget
                          .map(
                            (i) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: TravelItemRow(
                                item: i,
                                membersById: membersById,
                                onChanged: () => _refresh(ref),
                              ),
                            ),
                          )
                          .toList(),
                    ),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '＋ 添加预算',
                block: true,
                onPressed: () =>
                    _addItem(context, ref, plan.id, TravelItemType.budget),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  void _refresh(WidgetRef ref) {
    ref.invalidate(travelDaysProvider(planId));
    ref.invalidate(travelItemsProvider(planId));
  }

  void _editPlan(BuildContext context, TravelPlan plan) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TravelFormSheet(plan: plan),
    );
  }

  Future<void> _editAgenda(
      BuildContext context, WidgetRef ref, TravelDay day) async {
    final controller = TextEditingController(text: day.agenda);
    final result = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AgendaSheet(day: day, controller: controller),
    );
    controller.dispose();
    if (result != null) {
      await ref
          .read(travelNotifier.notifier)
          .saveDay(day.copyWith(agenda: result, dayIndex: day.dayIndex));
      _refresh(ref);
    }
  }

  Future<void> _addDay(
      BuildContext context, WidgetRef ref, String planId) async {
    final now = DateTime.now();
    final existing =
        await ref.read(repositoriesProvider).travel.getDays(planId);
    final next = existing.isEmpty
        ? 1
        : existing.map((d) => d.dayIndex).reduce((a, b) => a > b ? a : b) + 1;
    final day = TravelDay(
      id: IdGenerator.newId(IdPrefix.day),
      planId: planId,
      dayIndex: next,
      date: now.add(Duration(days: next - 1)),
      agenda: '',
      createdAt: now,
      updatedAt: now,
      version: 1,
      deletedAt: null,
    );
    final controller = TextEditingController();
    final result = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AgendaSheet(day: day, controller: controller, isNew: true),
    );
    controller.dispose();
    if (result != null) {
      final newDay = TravelDay(
        id: IdGenerator.newId(IdPrefix.day),
        planId: planId,
        dayIndex: next,
        date: now.add(Duration(days: next - 1)),
        agenda: result,
        createdAt: now,
        updatedAt: now,
        version: 1,
        deletedAt: null,
      );
      await ref.read(travelNotifier.notifier).saveDay(newDay);
      _refresh(ref);
    }
  }

  void _addItem(BuildContext context, WidgetRef ref, String planId,
      TravelItemType type) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TravelItemSheet(planId: planId, type: type),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.plan,
    required this.membersById,
    required this.onEdit,
    required this.onBack,
  });
  final TravelPlan plan;
  final Map<String, Member> membersById;
  final VoidCallback onEdit;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final participants = plan.memberIds
        .where((id) => membersById.containsKey(id))
        .toList();
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 12),
      decoration: BoxDecoration(
        color: theme.bg.withOpacity(0.88),
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: onBack,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: theme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [theme.shadows.xs],
                ),
                child: const Center(child: Text('‹', style: TextStyle(fontSize: 20))),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plan.title,
                      style: AppTextStyles.display(20, weight: FontWeight.w700)),
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
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onEdit,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: theme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [theme.shadows.xs],
                ),
                child: const Center(child: Text('✎', style: TextStyle(fontSize: 18))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text,
          style: AppTextStyles.sans(15, weight: FontWeight.w800)
              .copyWith(color: theme.textPrimary)),
    );
  }
}

class _AgendaSheet extends StatelessWidget {
  const _AgendaSheet({
    required this.day,
    required this.controller,
    this.isNew = false,
  });
  final TravelDay day;
  final TextEditingController controller;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
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
          Text(isNew ? '添加行程日' : '编辑第 ${day.dayIndex} 天',
              style: AppTextStyles.display(20, weight: FontWeight.w700)),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: '今天的安排，如：抵达 + 海边漫步',
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
          const SizedBox(height: 16),
          AppButton(
            label: '保存',
            block: true,
            onPressed: () =>
                Navigator.of(context).pop(controller.text.trim()),
          ),
        ],
      ),
    );
  }
}
