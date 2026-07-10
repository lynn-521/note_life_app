/// 统一异常（system_design §7.5）。
///
/// 仓储/引擎执行失败统一抛出 [AppException]，携带 code 与 message，便于 UI 展示。
class AppException implements Exception {
  /// 构造一个应用异常。
  const AppException(this.message, {this.code});

  /// 错误码（便于分类处理，如 'NOT_FOUND' / 'CONFLICT'）。
  final String? code;

  /// 人类可读信息。
  final String message;

  @override
  String toString() => code != null ? '[$code] $message' : message;

  /// 由任意异常包装为 [AppException]。
  factory AppException.from(Object error, {String? code}) {
    if (error is AppException) return error;
    return AppException(error.toString(), code: code);
  }
}
