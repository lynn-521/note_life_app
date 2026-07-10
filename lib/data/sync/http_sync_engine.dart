/// 真实 HTTP 同步引擎（backend_design §2.3，替换 local_stub_sync_engine）。
///
/// push：收集本地 updatedAt > lastSyncAt 的脏行 → POST /sync/push（批量 upsert）；
/// pull：POST /sync/pull?since= 拉回远端变更，按整行 LWW 合并；deletedAt 非空者
/// 本地应用软删；合并后更新 lastSyncAt。全部请求经 [ApiClient] 自动内/外网切换。
/// 离线：本地照常落库，联网后下次 syncAll 自然重放（脏判定基于 updatedAt）。
import 'dart:convert';

import '../core/constants/app_constants.dart';
import '../core/network/api_client.dart';
import '../models/base/sync_entity.dart';
import '../models/category.dart';
import '../models/daily_meal.dart';
import '../models/dose_log.dart';
import '../models/dose_schedule.dart';
import '../models/inbound_order.dart';
import '../models/medication.dart';
import '../models/memo.dart';
import '../models/member.dart';
import '../models/outbound_order.dart';
import '../models/product.dart';
import '../models/recipe.dart';
import '../models/reminder_log.dart';
import '../models/reminder_rule.dart';
import '../models/stock_batch.dart';
import '../models/travel_day.dart';
import '../models/travel_item.dart';
import '../models/travel_plan.dart';
import '../repositories/repository.dart';
import 'sync_engine.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 单类同步定义（键名对齐 backend_design §1.7.1）。
class _EntitySync {
  const _EntitySync({
    required this.key,
    required this.modelType,
    required this.fetchAll,
    required this.upsert,
    required this.fromJson,
  });

  /// 后端 changes 映射键（camelCase）。
  final String key;

  /// 模型运行时类型（用于按类型分组）。
  final Type modelType;

  /// 拉取全部本地行（含软删，供 push 过滤脏数据）。
  final Future<List<dynamic>> Function() fetchAll;

  /// 远端变更 upsert 到本地。
  final Future<void> Function(dynamic model) upsert;

  /// JSON → 模型。
  final dynamic Function(Map<String, dynamic> json) fromJson;
}

/// 真实同步引擎：本地变更 push，远端变更 pull 合并（PRD §6.4 / backend_design §2.3）。
class HttpSyncEngine implements SyncEngine {
  /// 构造。
  HttpSyncEngine({
    required ApiClient apiClient,
    required AppRepositories repositories,
  })  : _api = apiClient,
        _repos = repositories {
    _registry = _buildRegistry();
  }

  final ApiClient _api;
  final AppRepositories _repos;
  late final List<_EntitySync> _registry;

  List<_EntitySync> _buildRegistry() {
    final db = _repos.db;
    return <_EntitySync>[
      _EntitySync(
        'members',
        Member,
        () async => (await db.memberDao.getAllForSync()) as List<dynamic>,
        (m) => db.memberDao.save(m as Member),
        Member.fromJson,
      ),
      _EntitySync(
        'categories',
        Category,
        () async =>
            (await db.inventoryDao.getAllCategoriesForSync()) as List<dynamic>,
        (m) => db.inventoryDao.saveCategory(m as Category),
        Category.fromJson,
      ),
      _EntitySync(
        'products',
        Product,
        () async =>
            (await db.inventoryDao.getAllProductsForSync()) as List<dynamic>,
        (m) => db.inventoryDao.saveProduct(m as Product),
        Product.fromJson,
      ),
      _EntitySync(
        'stockBatches',
        StockBatch,
        () async =>
            (await db.inventoryDao.getAllStockBatchesForSync())
                as List<dynamic>,
        (m) => db.inventoryDao.upsertStockBatch(m as StockBatch),
        StockBatch.fromJson,
      ),
      _EntitySync(
        'inbound',
        InboundOrder,
        () async =>
            (await db.inventoryDao.getAllInboundForSync()) as List<dynamic>,
        (m) => db.inventoryDao.upsertInbound(m as InboundOrder),
        InboundOrder.fromJson,
      ),
      _EntitySync(
        'outbound',
        OutboundOrder,
        () async =>
            (await db.inventoryDao.getAllOutboundForSync()) as List<dynamic>,
        (m) => db.inventoryDao.upsertOutbound(m as OutboundOrder),
        OutboundOrder.fromJson,
      ),
      _EntitySync(
        'medications',
        Medication,
        () async =>
            (await db.medicationDao.getAllMedicationsForSync()) as List<dynamic>,
        (m) => db.medicationDao.saveMedication(m as Medication),
        Medication.fromJson,
      ),
      _EntitySync(
        'doseSchedules',
        DoseSchedule,
        () async =>
            (await db.medicationDao.getAllSchedulesForSync()) as List<dynamic>,
        (m) => db.medicationDao.saveDoseSchedule(m as DoseSchedule),
        DoseSchedule.fromJson,
      ),
      _EntitySync(
        'doseLogs',
        DoseLog,
        () async => (await db.medicationDao.getAllLogsForSync()) as List<dynamic>,
        (m) => db.medicationDao.saveDoseLog(m as DoseLog),
        DoseLog.fromJson,
      ),
      _EntitySync(
        'recipes',
        Recipe,
        () async => (await db.recipeDao.getAllRecipesForSync()) as List<dynamic>,
        (m) => db.recipeDao.saveRecipe(m as Recipe),
        Recipe.fromJson,
      ),
      _EntitySync(
        'dailyMeals',
        DailyMeal,
        () async =>
            (await db.recipeDao.getAllDailyMealsForSync()) as List<dynamic>,
        (m) => db.recipeDao.addDailyMeal(m as DailyMeal),
        DailyMeal.fromJson,
      ),
      _EntitySync(
        'memos',
        Memo,
        () async => (await db.memoDao.getAllForSync()) as List<dynamic>,
        (m) => db.memoDao.saveMemo(m as Memo),
        Memo.fromJson,
      ),
      _EntitySync(
        'travelPlans',
        TravelPlan,
        () async => (await db.travelDao.getAllPlansForSync()) as List<dynamic>,
        (m) => db.travelDao.saveTravelPlan(m as TravelPlan),
        TravelPlan.fromJson,
      ),
      _EntitySync(
        'travelDays',
        TravelDay,
        () async => (await db.travelDao.getAllDaysForSync()) as List<dynamic>,
        (m) => db.travelDao.saveTravelDay(m as TravelDay),
        TravelDay.fromJson,
      ),
      _EntitySync(
        'travelItems',
        TravelItem,
        () async => (await db.travelDao.getAllItemsForSync()) as List<dynamic>,
        (m) => db.travelDao.saveTravelItem(m as TravelItem),
        TravelItem.fromJson,
      ),
      _EntitySync(
        'reminderRules',
        ReminderRule,
        () async =>
            (await db.reminderDao.getAllRulesForSync()) as List<dynamic>,
        (m) => db.reminderDao.saveRule(m as ReminderRule),
        ReminderRule.fromJson,
      ),
      _EntitySync(
        'reminderLogs',
        ReminderLog,
        () async =>
            (await db.reminderDao.getAllLogsForSync()) as List<dynamic>,
        (m) => db.reminderDao.upsertLog(m as ReminderLog),
        ReminderLog.fromJson,
      ),
    ];
  }

  @override
  Future<SyncResult> push(List<SyncEntity> changes) async {
    final since = await _loadLastSyncAt();
    final payload =
        changes.isNotEmpty ? _groupByType(changes) : await _collectDirtySince(since);
    if (payload.isEmpty) {
      return SyncResult(success: true, syncedAt: DateTime.now(), count: 0);
    }
    final resp = await _api.post(
      '/sync/push',
      <String, dynamic>{'changes': payload},
    );
    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    final serverNow = DateTime.parse(body['serverNow'] as String);
    await _saveLastSyncAt(serverNow);
    return SyncResult(
      success: true,
      syncedAt: serverNow,
      count: _countPayload(payload),
    );
  }

  @override
  Future<List<SyncEntity>> pull(DateTime since) async {
    final resp = await _api.post(
      '/sync/pull?since=${_iso(since)}',
      <String, dynamic>{},
    );
    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    final changes =
        (body['changes'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final syncedAt = DateTime.parse(body['syncedAt'] as String);
    final merged = <SyncEntity>[];
    for (final def in _registry) {
      final list = changes[def.key];
      if (list == null) continue;
      for (final item in list as List) {
        final model =
            def.fromJson(item as Map<String, dynamic>) as SyncEntity;
        await def.upsert(model);
        merged.add(model);
      }
    }
    await _saveLastSyncAt(syncedAt);
    return merged;
  }

  /// 完整同步：收集本地脏数据 push，再 pull 远端变更合并（供启动 / 手动触发）。
  Future<SyncResult> syncAll() async {
    try {
      if (!_api.config.isConfigured) {
        return SyncResult(success: false, syncedAt: DateTime.now());
      }
      final since = await _loadLastSyncAt();
      final pushed = await push(<SyncEntity>[]);
      if (!pushed.success) {
        return SyncResult(success: false, syncedAt: DateTime.now());
      }
      final pulled = await pull(since);
      return SyncResult(
        success: true,
        syncedAt: DateTime.now(),
        count: pushed.count + pulled.length,
      );
    } catch (e) {
      // 离线 / 服务器不可达：本地数据不受影响，下次联网自动重放。
      print('[Sync] syncAll 失败（已忽略，保留本地数据）: $e');
      return SyncResult(success: false, syncedAt: DateTime.now());
    }
  }

  /// 收集本地 updatedAt > since 的脏行，按实体类型分组为 JSON。
  Future<Map<String, List<Map<String, dynamic>>>> _collectDirtySince(
      DateTime since) async {
    final out = <String, List<Map<String, dynamic>>>{};
    for (final def in _registry) {
      final all = await def.fetchAll();
      final dirty = all
          .where((e) => (e as SyncEntity).updatedAt.isAfter(since))
          .toList();
      if (dirty.isNotEmpty) {
        out[def.key] = dirty
            .map((e) => (e as dynamic).toJson() as Map<String, dynamic>)
            .toList();
      }
    }
    return out;
  }

  /// 将显式传入的变更按模型类型分组（对齐后端 changes 键名）。
  Map<String, List<Map<String, dynamic>>> _groupByType(
      List<SyncEntity> changes) {
    final byType = <Type, _EntitySync>{
      for (final d in _registry) d.modelType: d
    };
    final out = <String, List<Map<String, dynamic>>>{};
    for (final c in changes) {
      final def = byType[c.runtimeType];
      if (def == null) continue;
      (out[def.key] ??= <Map<String, dynamic>>[])
          .add((c as dynamic).toJson() as Map<String, dynamic>);
    }
    return out;
  }

  int _countPayload(Map<String, List<Map<String, dynamic>>> payload) =>
      payload.values.fold(0, (sum, list) => sum + list.length);

  String _iso(DateTime dt) => dt.toUtc().toIso8601String();

  Future<DateTime> _loadLastSyncAt() async {
    final prefs = await SharedPreferences.getInstance();
    final ms = prefs.getInt(AppConstants.lastSyncAtKey);
    if (ms == null) {
      return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
    }
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
  }

  Future<void> _saveLastSyncAt(DateTime dt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      AppConstants.lastSyncAtKey,
      dt.toUtc().millisecondsSinceEpoch,
    );
  }
}
