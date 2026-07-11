/// 健康模块 Provider（system_design §T06）。
library;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/state/async_state.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/dose_log.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/stock_view.dart';
import '../../../providers/app_providers.dart';

/// 某成员今日待服列表：由用药计划 times 展开 + 已有打卡记录。
final todayDosesProvider =
    FutureProvider.family<List<DoseToday>, String>((ref, memberId) async {
  final medRepo = ref.watch(repositoriesProvider).medication;
  final meds = await medRepo.getByMember(memberId);
  final result = <DoseToday>[];
  for (final med in meds) {
    if (!med.active) continue;
    for (final t in med.times) {
      final scheduledTime = DateTimeX.todayAt(t.hour, t.minute);
      final logId = IdGenerator.doseLogId(med.id, scheduledTime);
      final log = await medRepo.getDoseLogById(logId);
      final status = log?.status ?? DoseStatus.pending;
      result.add(DoseToday(
        medication: med,
        scheduledTime: scheduledTime,
        logId: logId,
        status: status,
      ));
    }
  }
  final rank = {
    DoseStatus.pending: 0,
    DoseStatus.skipped: 1,
    DoseStatus.done: 2,
  };
  result.sort((a, b) {
    final r = rank[a.status]! - rank[b.status]!;
    if (r != 0) return r;
    return a.scheduledTime.compareTo(b.scheduledTime);
  });
  return result;
});

/// 服药打卡 Notifier（done / skipped 幂等 upsert + 触发扫描）。
final checkInNotifier =
    NotifierProvider<CheckInNotifier, AsyncState<bool>>(CheckInNotifier.new);

/// 打卡动作。
class CheckInNotifier extends Notifier<AsyncState<bool>> {
  @override
  AsyncState<bool> build() => const AsyncState.idle();

  /// 打卡（按稳定 logId 幂等写入）。
  Future<void> checkIn({
    required String medicationId,
    required String memberId,
    required DateTime scheduledTime,
    required DoseStatus status,
  }) async {
    state = const AsyncState.loading();
    try {
      final medRepo = ref.read(repositoriesProvider).medication;
      final logId = IdGenerator.doseLogId(medicationId, scheduledTime);
      final now = DateTime.now();
      final existing = await medRepo.getDoseLogById(logId);
      final log = DoseLogModel(
        id: logId,
        medicationId: medicationId,
        memberId: memberId,
        scheduledTime: scheduledTime,
        status: status,
        takenAt: status == DoseStatus.done ? now : null,
        note: existing?.note,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await medRepo.checkIn(log);
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }
}
