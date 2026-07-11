/// TravelRepository（class-diagram.mermaid · TravelRepository）。
library;
import '../models/travel_day.dart';
import '../models/travel_item.dart';
import '../models/travel_plan.dart';
import '../local_db/app_database.dart';

/// 旅游计划书仓储接口。
abstract class TravelRepository {
  /// 监听全部计划书。
  Stream<List<TravelPlanModel>> watchAll();

  /// 获取全部计划书。
  Future<List<TravelPlanModel>> getAll();

  /// 按 id 获取。
  Future<TravelPlanModel?> getById(String id);

  /// 保存计划书（不含子项）。
  Future<void> saveTravelPlan(TravelPlanModel plan);

  /// 软删计划书（级联子项）。
  Future<void> deleteTravelPlan(String id);

  /// 保存行程日。
  Future<void> saveTravelDay(TravelDayModel day);

  /// 保存清单项。
  Future<void> saveTravelItem(TravelItemModel item);

  /// 软删清单项。
  Future<void> deleteTravelItem(String id);

  /// 获取行程日。
  Future<List<TravelDayModel>> getDays(String planId);

  /// 获取清单项。
  Future<List<TravelItemModel>> getItems(String planId);
}

/// 基于 Drift 的实现。
class TravelRepositoryImpl implements TravelRepository {
  /// 构造。
  TravelRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Stream<List<TravelPlanModel>> watchAll() => db.travelDao.watchAll();

  @override
  Future<List<TravelPlanModel>> getAll() => db.travelDao.getAll();

  @override
  Future<TravelPlanModel?> getById(String id) => db.travelDao.getById(id);

  @override
  Future<void> saveTravelPlan(TravelPlanModel plan) =>
      db.travelDao.saveTravelPlan(plan);

  @override
  Future<void> deleteTravelPlan(String id) =>
      db.travelDao.softDeleteTravelPlan(id);

  @override
  Future<void> saveTravelDay(TravelDayModel day) => db.travelDao.saveTravelDay(day);

  @override
  Future<void> saveTravelItem(TravelItemModel item) =>
      db.travelDao.saveTravelItem(item);

  @override
  Future<void> deleteTravelItem(String id) =>
      db.travelDao.softDeleteTravelItem(id);

  @override
  Future<List<TravelDayModel>> getDays(String planId) =>
      db.travelDao.getDays(planId);

  @override
  Future<List<TravelItemModel>> getItems(String planId) =>
      db.travelDao.getItems(planId);
}
