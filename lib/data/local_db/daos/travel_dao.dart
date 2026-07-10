/// TravelDao（class-diagram.mermaid · TravelDao）。
import 'package:drift/drift.dart';

import '../../models/travel_day.dart';
import '../../models/travel_item.dart';
import '../../models/travel_plan.dart';
import '../tables/travel_day_table.dart';
import '../tables/travel_item_table.dart';
import '../tables/travel_plan_table.dart';
import 'base_dao.dart';
import '../app_database.dart' show AppDatabase;
part 'travel_dao.g.dart';

/// 旅游计划书数据访问。
@DriftAccessor(tables: [TravelPlans, TravelDays, TravelItems])
class TravelDao extends DatabaseAccessor<AppDatabase>
    with _$TravelDaoMixin, BaseDao {
  /// 构造。
  TravelDao(super.db);

  /// 监听全部未删除计划书。
  Stream<List<TravelPlan>> watchAll() =>
      (select(travelPlans)..where((t) => t.deletedAt.isNull()))
          .watch()
          .map((rows) => rows.map(_toPlan).toList());

  /// 获取全部未删除计划书。
  Future<List<TravelPlan>> getAll() async =>
      (await (select(travelPlans)..where((t) => t.deletedAt.isNull())).get())
          .map(_toPlan)
          .toList();

  /// 按 id 获取。
  Future<TravelPlan?> getById(String id) async {
    final row = await (select(travelPlans)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toPlan(row);
  }

  /// 保存计划书（upsert，不含行程/清单子项）。
  Future<void> saveTravelPlan(TravelPlan p) =>
      into(travelPlans).insertOnConflictUpdate(_toPlanCompanion(p));

  /// 软删计划书（级联删除子项）。
  Future<void> softDeleteTravelPlan(String id) async {
    await db.transaction(() async {
      await (update(travelPlans)..where((t) => t.id.equals(id)))
          .write(TravelPlansCompanion(deletedAt: Value(now)));
      await (delete(travelDays)..where((t) => t.planId.equals(id))).go();
      await (delete(travelItems)..where((t) => t.planId.equals(id))).go();
    });
  }

  /// 保存行程日（upsert）。
  Future<void> saveTravelDay(TravelDay d) =>
      into(travelDays).insertOnConflictUpdate(_toDayCompanion(d));

  /// 保存清单项（upsert）。
  Future<void> saveTravelItem(TravelItem item) =>
      into(travelItems).insertOnConflictUpdate(_toItemCompanion(item));

  /// 软删清单项。
  Future<void> softDeleteTravelItem(String id) =>
      (delete(travelItems)..where((t) => t.id.equals(id))).go();

  /// 某计划书行程日（按天序）。
  Future<List<TravelDay>> getDays(String planId) async =>
      (await (select(travelDays)
            ..where((t) => t.planId.equals(planId))
            ..orderBy([(t) => OrderingTerm.asc(t.dayIndex)]))
          .get())
          .map(_toDay)
          .toList();

  /// 某计划书清单项。
  Future<List<TravelItem>> getItems(String planId) async =>
      (await (select(travelItems)..where((t) => t.planId.equals(planId))).get())
          .map(_toItem)
          .toList();

  /// 获取全部计划书（含软删，供同步推送使用）。
  Future<List<TravelPlan>> getAllPlansForSync() async =>
      (await select(travelPlans).get()).map(_toPlan).toList();

  /// 获取全部行程日（含软删，供同步推送使用）。
  Future<List<TravelDay>> getAllDaysForSync() async =>
      (await select(travelDays).get()).map(_toDay).toList();

  /// 获取全部清单项（含软删，供同步推送使用）。
  Future<List<TravelItem>> getAllItemsForSync() async =>
      (await select(travelItems).get()).map(_toItem).toList();

  TravelPlan _toPlan(TravelPlanRow r) => TravelPlan(
        id: r.id,
        title: r.title,
        start: r.start,
        end: r.end,
        memberIds: r.memberIds,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  TravelDay _toDay(TravelDayRow r) => TravelDay(
        id: r.id,
        planId: r.planId,
        dayIndex: r.dayIndex,
        date: r.date,
        agenda: r.agenda,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  TravelItem _toItem(TravelItemRow r) => TravelItem(
        id: r.id,
        planId: r.planId,
        type: r.type,
        name: r.name,
        qty: r.qty,
        amount: r.amount,
        done: r.done,
        assignedTo: r.assignedTo,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  TravelPlansCompanion _toPlanCompanion(TravelPlan p) =>
      TravelPlansCompanion.insert(
        id: Value(p.id),
        title: Value(p.title),
        start: Value(p.start),
        end: Value(p.end),
        memberIds: Value(p.memberIds),
        createdAt: Value(p.createdAt),
        updatedAt: Value(p.updatedAt),
        version: Value(p.version),
        deletedAt: Value(p.deletedAt),
      );

  TravelDaysCompanion _toDayCompanion(TravelDay d) => TravelDaysCompanion.insert(
        id: Value(d.id),
        planId: Value(d.planId),
        dayIndex: Value(d.dayIndex),
        date: Value(d.date),
        agenda: Value(d.agenda),
        createdAt: Value(d.createdAt),
        updatedAt: Value(d.updatedAt),
        version: Value(d.version),
        deletedAt: Value(d.deletedAt),
      );

  TravelItemsCompanion _toItemCompanion(TravelItem i) =>
      TravelItemsCompanion.insert(
        id: Value(i.id),
        planId: Value(i.planId),
        type: Value(i.type),
        name: Value(i.name),
        qty: Value(i.qty),
        amount: Value(i.amount),
        done: Value(i.done),
        assignedTo: Value(i.assignedTo),
        createdAt: Value(i.createdAt),
        updatedAt: Value(i.updatedAt),
        version: Value(i.version),
        deletedAt: Value(i.deletedAt),
      );
}
