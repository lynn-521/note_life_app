/// JSON 转换器：TimeOfDay 列表 ↔ 字符串列表。
///
/// 用法（模型字段上方）：
/// ```dart
/// @TimeOfDayListConverter()
/// required List<TimeOfDay> times,
/// ```
library;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

/// TimeOfDay → "HH:mm" 字符串（**零填充**，避免 "9:0" 这种丑格式）。
String timeOfDayToJson(TimeOfDay time) =>
    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

/// "HH:mm" 字符串 → TimeOfDay。
TimeOfDay timeOfDayFromJson(String json) {
  final parts = json.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

/// [List<TimeOfDay>] 的 JSON 转换器（序列化为 `List<String>`，每个元素 "HH:mm"）。
class TimeOfDayListConverter
    implements JsonConverter<List<TimeOfDay>, List<String>> {
  /// 默认构造。
  const TimeOfDayListConverter();

  @override
  List<TimeOfDay> fromJson(List<String> json) =>
      json.map(timeOfDayFromJson).toList(growable: false);

  @override
  List<String> toJson(List<TimeOfDay> times) =>
      times.map(timeOfDayToJson).toList(growable: false);
}
