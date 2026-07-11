/// Drift 存储转换器：枚举 / 列表 / 时间 / Map ↔ 存储类型（system_design §7.3）。
library;
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/json_converters.dart';

/// 枚举 ↔ 字符串。按 `.name` 序列化（与 freezed JSON 一致）。
class EnumConverter<T extends Enum> extends TypeConverter<T, String> {
  /// 构造，传入枚举的 `values` 列表。
  const EnumConverter(this.values);

  /// 枚举值列表。
  final List<T> values;

  @override
  T fromSql(String fromDb) => (values as List<Enum>).byName(fromDb) as T;

  @override
  String toSql(T value) => value.name;
}

/// `List<String>` ↔ JSON 字符串（tags / 成员 id 列表等）。
class StringListConverter extends TypeConverter<List<String>, String> {
  /// 构造。
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb) as List<dynamic>;
    return decoded.map((e) => e as String).toList();
  }

  @override
  String toSql(List<String> value) => jsonEncode(value);
}

/// `List<TimeOfDay>` ↔ JSON 字符串（用药时间点）。
class DriftTimeOfDayListConverter
    extends TypeConverter<List<TimeOfDay>, String> {
  /// 构造。
  const DriftTimeOfDayListConverter();

  @override
  List<TimeOfDay> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb) as List<dynamic>;
    return decoded.map((e) => timeOfDayFromJson(e as String)).toList();
  }

  @override
  String toSql(List<TimeOfDay> value) =>
      jsonEncode(value.map(timeOfDayToJson).toList());
}

/// `Map<String, dynamic>` ↔ JSON 字符串（ReminderRuleModel.config）。
class MapConverter extends TypeConverter<Map<String, dynamic>, String> {
  /// 构造。
  const MapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      Map<String, dynamic>.from(jsonDecode(fromDb) as Map);

  @override
  String toSql(Map<String, dynamic> value) => jsonEncode(value);
}
