/// JSON 转换器：TimeOfDay 列表 ↔ 字符串列表、DateTime ↔ UTC ISO8601(Z)。
///
/// 用法（模型字段上方）：
/// ```dart
/// @TimeOfDayListConverter()
/// required List<TimeOfDay> times,
///
/// @UtcDateTimeConverter()
/// required DateTime createdAt,
/// ```
///
/// 设计动机（cross-repo-conventions §1 §3）：
/// - App 端 `DateTime.now()` 默认返回**本地**时区；
/// - 默认 toIso8601String 也不带 `Z`；
/// - 后端按 UTC 解析会把本地时间多算或漏算数小时，触发 silently 8h 偏差。
/// 因此所有 freezed 模型的 DateTime 字段统一加 `@UtcDateTimeConverter()`，
/// 序列化时 `.toUtc().toIso8601String()`（必带 `Z`），反序列化时 `.toUtc()`。
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

/// [DateTime] 的 JSON 转换器：写入时强制转 UTC + ISO8601(以 `Z` 结尾)；
/// 读取时再 `.toUtc()` 一次以防后端漏发 `Z` 时被解析成本地时间。
///
/// 覆盖所有 18 个 freezed 模型的所有 DateTime 字段（`createdAt` /
/// `updatedAt` / `deletedAt` / `startDate` / `endDate` / `dueAt` /
/// `scheduledTime` / `firedAt` / `inboundAt` / `expireDate` / `at` /
/// `date` / `start` / `end` / `takenAt` / `scheduledTime` 等）。
class UtcDateTimeConverter implements JsonConverter<DateTime, String> {
  /// 默认构造。
  const UtcDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  @override
  String toJson(DateTime dt) => dt.toUtc().toIso8601String();
}
