/// 生活模块 Provider（system_design §T08 / §T09）。
library;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/state/async_state.dart';
import '../../../data/models/memo.dart';
import '../../../data/models/travel_day.dart';
import '../../../data/models/travel_item.dart';
import '../../../data/models/travel_plan.dart';
import '../../../providers/app_providers.dart';

/// 备忘录流。
final memosProvider =
    StreamProvider<List<MemoModel>>((ref) => ref.watch(repositoriesProvider).memo.watchAll());

/// 旅游计划书流。
final travelPlansProvider = StreamProvider<List<TravelPlanModel>>(
    (ref) => ref.watch(repositoriesProvider).travel.watchAll());

/// 某计划书行程日。
final travelDaysProvider =
    FutureProvider.family<List<TravelDayModel>, String>((ref, planId) {
  return ref.watch(repositoriesProvider).travel.getDays(planId);
});

/// 某计划书清单项。
final travelItemsProvider =
    FutureProvider.family<List<TravelItemModel>, String>((ref, planId) {
  return ref.watch(repositoriesProvider).travel.getItems(planId);
});

/// 备忘录动作 Notifier（保存 / 删除 / 置顶 / 完成 / 设到期）。
final memoNotifier =
    NotifierProvider<MemoNotifier, AsyncState<bool>>(MemoNotifier.new);

class MemoNotifier extends Notifier<AsyncState<bool>> {
  @override
  AsyncState<bool> build() => const AsyncState.idle();

  Future<void> save(MemoModel memo) async {
    state = const AsyncState.loading();
    try {
      await ref.read(repositoriesProvider).memo.saveMemo(memo);
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }

  Future<void> delete(String id) async {
    state = const AsyncState.loading();
    try {
      await ref.read(repositoriesProvider).memo.deleteMemo(id);
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }

  Future<void> togglePin(MemoModel m) =>
      _write(m.copyWith(pinned: !m.pinned, updatedAt: DateTime.now()));

  Future<void> toggleDone(MemoModel m) =>
      _write(m.copyWith(done: !m.done, updatedAt: DateTime.now()));

  Future<void> setDue(MemoModel m, DateTime? due) =>
      _write(m.copyWith(dueAt: due, updatedAt: DateTime.now()));

  Future<void> _write(MemoModel m) async {
    await ref.read(repositoriesProvider).memo.saveMemo(m);
  }
}

/// 旅游计划书动作 Notifier（计划 / 行程 / 清单项的 CRUD）。
final travelNotifier =
    NotifierProvider<TravelNotifier, AsyncState<bool>>(TravelNotifier.new);

class TravelNotifier extends Notifier<AsyncState<bool>> {
  @override
  AsyncState<bool> build() => const AsyncState.idle();

  Future<void> savePlan(TravelPlanModel p) async {
    state = const AsyncState.loading();
    try {
      await ref.read(repositoriesProvider).travel.saveTravelPlan(p);
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }

  Future<void> deletePlan(String id) async {
    state = const AsyncState.loading();
    try {
      await ref.read(repositoriesProvider).travel.deleteTravelPlan(id);
      state = const AsyncState.data(true);
    } catch (e) {
      state = AsyncState.error(e);
    }
  }

  Future<void> saveDay(TravelDayModel d) async {
    await ref.read(repositoriesProvider).travel.saveTravelDay(d);
  }

  Future<void> saveItem(TravelItemModel i) async {
    await ref.read(repositoriesProvider).travel.saveTravelItem(i);
  }

  Future<void> deleteItem(String id) async {
    await ref.read(repositoriesProvider).travel.deleteTravelItem(id);
  }

  Future<void> toggleItemDone(TravelItemModel i) =>
      _writeItem(i.copyWith(done: !i.done));

  Future<void> claimItem(TravelItemModel i, String? memberId) =>
      _writeItem(i.copyWith(assignedTo: memberId));

  Future<void> _writeItem(TravelItemModel i) async {
    await ref.read(repositoriesProvider).travel.saveTravelItem(i);
  }
}
