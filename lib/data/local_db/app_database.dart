/// AppDatabase（class-diagram.mermaid · AppDatabase）。
///
/// Drift 数据库：装配全部 19 张表与 7 个 DAO。
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/inventory_dao.dart';
import 'daos/medication_dao.dart';
import 'daos/memo_dao.dart';
import 'daos/recipe_dao.dart';
import 'daos/reminder_dao.dart';
import 'daos/travel_dao.dart';
import 'tables/category_table.dart';
import 'tables/daily_meal_table.dart';
import 'tables/dose_log_table.dart';
import 'tables/dose_schedule_table.dart';
import 'tables/inbound_order_table.dart';
import 'tables/medication_table.dart';
import 'tables/member_table.dart';
import 'tables/memo_table.dart';
import 'tables/outbound_order_table.dart';
import 'tables/product_table.dart';
import 'tables/recipe_cookable_by_table.dart';
import 'tables/recipe_ingredient_table.dart';
import 'tables/recipe_table.dart';
import 'tables/reminder_log_table.dart';
import 'tables/reminder_rule_table.dart';
import 'tables/stock_batch_table.dart';
import 'tables/travel_day_table.dart';
import 'tables/travel_item_table.dart';
import 'tables/travel_plan_table.dart';
import 'daos/member_dao.dart';
part 'app_database.g.dart';

/// 家庭管家本地数据库。
@DriftDatabase(
  tables: [
    Members,
    Categories,
    Products,
    StockBatches,
    InboundOrders,
    OutboundOrders,
    Medications,
    DoseSchedules,
    DoseLogs,
    Recipes,
    RecipeIngredients,
    RecipeCookableBys,
    DailyMeals,
    Memos,
    TravelPlans,
    TravelDays,
    TravelItems,
    ReminderRules,
    ReminderLogs,
  ],
  daos: [
    MemberDao,
    InventoryDao,
    MedicationDao,
    RecipeDao,
    MemoDao,
    TravelDao,
    ReminderDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// 构造；未显式传入执行器时使用默认文件型数据库。
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  /// 默认连接（drift_flutter 负责路径与 sqlite 初始化）。
  static QueryExecutor _openConnection() => driftDatabase(name: 'family_butler');
}
