/// AppRepositories 容器（system_design §3.3 · 各 Repository 汇总）。
///
/// 集中持有全部仓储实现，供 [app_providers.dart] 一次性装配。
library;
import '../local_db/app_database.dart';
import 'inventory_repository.dart';
import 'member_repository.dart';
import 'medication_repository.dart';
import 'memo_repository.dart';
import 'product_repository.dart';
import 'recipe_repository.dart';
import 'reminder_repository.dart';
import 'travel_repository.dart';

export 'inventory_repository.dart';
export 'member_repository.dart';
export 'medication_repository.dart';
export 'memo_repository.dart';
export 'product_repository.dart';
export 'recipe_repository.dart';
export 'reminder_repository.dart';
export 'travel_repository.dart';

/// 全部仓储的集合。
class AppRepositories {
  /// 构造；基于同一 [AppDatabase] 装配各仓库实现。
  AppRepositories(this.db)
      : member = MemberRepositoryImpl(db),
        product = ProductRepositoryImpl(db),
        inventory = InventoryRepositoryImpl(db),
        medication = MedicationRepositoryImpl(db),
        recipe = RecipeRepositoryImpl(db),
        memo = MemoRepositoryImpl(db),
        travel = TravelRepositoryImpl(db),
        reminder = ReminderRepositoryImpl(db);

  /// 数据库。
  final AppDatabase db;

  /// 成员仓储。
  final MemberRepository member;

  /// 商品 / 分类仓储。
  final ProductRepository product;

  /// 库存仓储。
  final InventoryRepository inventory;

  /// 用药仓储。
  final MedicationRepository medication;

  /// 菜谱 / 菜单仓储。
  final RecipeRepository recipe;

  /// 备忘录仓储。
  final MemoRepository memo;

  /// 旅游计划书仓储。
  final TravelRepository travel;

  /// 提醒仓储。
  final ReminderRepository reminder;
}
