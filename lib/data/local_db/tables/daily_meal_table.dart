/// DailyMeals 表（class-diagram.mermaid · DailyMealModel）。
///
/// 已补同步列 createdAt/updatedAt/version/deletedAt（对齐 backend_design §2.3）。
library;
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 今日菜单表（某日某餐别的排菜）。
class DailyMeals extends Table {
  String get dataClassName => 'DailyMealRow';

  TextColumn get id => text()();

  DateTimeColumn get date => dateTime()();

  TextColumn get mealType =>
      text().map(const EnumConverter<MealType>(MealType.values))();

  TextColumn get recipeId => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
