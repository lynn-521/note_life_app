/// 实体 ID 生成器：uuid v4 + 实体前缀（PRD §7.4 / system_design §7.1）。
import 'package:uuid/uuid.dart';

/// 各实体 ID 前缀（与 system_design §7.1 对齐）。
class IdPrefix {
  IdPrefix._();

  static const String member = 'mem_';
  static const String category = 'cat_';
  static const String product = 'prd_';
  static const String batch = 'bat_';
  static const String inbound = 'ino_';
  static const String outbound = 'out_';
  static const String medication = 'med_';
  static const String schedule = 'sch_';
  static const String log = 'log_';
  static const String recipe = 'rcp_';
  static const String ingredient = 'ing_';
  static const String cookableBy = 'cb_';
  static const String meal = 'meal_';
  static const String memo = 'memo_';
  static const String travel = 'trv_';
  static const String day = 'day_';
  static const String item = 'item_';
  static const String rule = 'rule_';
}

/// ID 生成工具。
class IdGenerator {
  IdGenerator._();

  static const Uuid _uuid = Uuid();

  /// 生成带前缀的 uuid v4（如 `prd_7f3a...`）。
  static String newId(String prefix) => '$prefix${_uuid.v4()}';

  /// 生成 DoseLog 的稳定 ID（按 用药计划 + 计划时间 确定性生成，便于 upsert）。
  static String doseLogId(String medicationId, DateTime scheduledTime) =>
      '${IdPrefix.log}${medicationId}_${scheduledTime.millisecondsSinceEpoch}';
}
