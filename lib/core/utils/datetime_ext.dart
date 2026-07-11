/// 日期/时间工具扩展（system_design §7.3）。
library;
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// 本地日期（去掉时分秒）。
  DateTime get dateOnly =>
      DateTime(year, month, day);

  /// 是否为同一天。
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  /// 距离 [other] 的自然日差（other 在今天之后为正）。
  int daysUntil(DateTime other) =>
      other.dateOnly.difference(dateOnly).inDays;

  /// 中文短日期（如「6 月 18 日 · 周三」）。
  String get zhShort {
    const weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    final w = weekdays[weekday - 1];
    return '$month 月 $day 日 · $w';
  }

  /// 中文长日期（如「2025 年 6 月 18 日」）。
  String get zhLong => DateFormat('yyyy 年 M 月 d 日').format(this);

  /// HH:mm（如「08:30」）。
  String get hhmm => DateFormat('HH:mm').format(this);

  /// 今天本地日期。
  static DateTime get today => DateTime.now().dateOnly;

  /// 构造今天的某个 TimeOfDay 时刻。
  static DateTime todayAt(int hour, int minute) =>
      DateTime.now().dateOnly.add(Duration(hours: hour, minutes: minute));
}
