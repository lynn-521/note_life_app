/// 健康页（system_design §T06）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../data/models/enums.dart';
import '../../data/models/member.dart';
import '../../data/models/stock_view.dart';
import '../../providers/app_providers.dart';
import '../shared/confetti.dart';
import '../shared/empty_state.dart';
import '../shared/screen_header.dart';
import 'package:family_butler/features/health/providers/health_providers.dart';
import 'widgets/dose_list_item.dart';
import 'widgets/medication_progress_ring.dart';
import 'widgets/member_switch.dart';

/// 健康 Tab 根页面。
class HealthPage extends ConsumerWidget {
  /// 构造。
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final members = ref.watch(membersProvider);
    final selectedId = ref.watch(currentMemberIdProvider);
    final selected = members.whenOrNull(
      data: (list) {
        if (list.isEmpty) return null;
        return list.firstWhere((m) => m.id == selectedId,
            orElse: () => list.first);
      },
    );
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            const ScreenHeader(title: '💊 健康'),
            const MemberSwitch(),
            if (selected == null)
              const Expanded(
                child: EmptyState(title: '还没有成员', subtitle: '去「我的」添加家庭成员吧～'),
              )
            else
              Expanded(child: _HealthBody(member: selected)),
          ],
        ),
      ),
    );
  }
}

class _HealthBody extends ConsumerWidget {
  const _HealthBody({required this.member});

  final MemberModel member;

  Future<void> _onCheckIn(
    WidgetRef ref,
    DoseToday dose,
    DoseStatus status,
  ) async {
    await ref.read(checkInNotifier.notifier).checkIn(
          medicationId: dose.medication.id,
          memberId: dose.medication.memberId,
          scheduledTime: dose.scheduledTime,
          status: status,
        );
    ref.invalidate(todayDosesProvider(dose.medication.memberId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doses = ref.watch(todayDosesProvider(member.id));
    return doses.when(
      data: (list) {
        if (list.isEmpty) {
          return const EmptyState(
              title: '今日无用药', subtitle: '该成员今天没有服药安排～');
        }
        final done = list.where((d) => d.status == DoseStatus.done).length;
        final total = list.length;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: MedicationProgressRing(
                done: done,
                total: total,
                memberName: member.name,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final dose = list[i];
                  return DoseListItem(
                    dose: dose,
                    onDone: () {
                      _onCheckIn(ref, dose, DoseStatus.done);
                      fireConfetti(context);
                    },
                    onSkip: () => _onCheckIn(ref, dose, DoseStatus.skipped),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('加载失败: $e')),
    );
  }
}
