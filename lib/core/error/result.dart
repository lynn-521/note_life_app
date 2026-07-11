/// 统一结果类型 [Result<T>]（system_design §7.5）。
///
/// 用于仓储返回「成功或失败」语义，避免抛异常打断控制流。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// 操作结果：成功携带值，或失败携带异常。
@freezed
class Result<T> with _$Result<T> {
  /// 成功。
  const factory Result.ok(T value) = _Ok<T>;

  /// 失败。
  const factory Result.err(Object error, {String? code}) = _Err<T>;

  const Result._();

  /// 是否成功。
  bool get isOk => this is _Ok<T>;

  /// 是否失败。
  bool get isErr => this is _Err<T>;

  /// 取值（失败抛 [StateError]）。
  T get requireValue {
    final self = this;
    if (self is _Ok<T>) return self.value;
    throw StateError('Result is not ok');
  }

  /// 失败原因（成功为 null）。
  Object? get errorOrNull {
    final self = this;
    return self is _Err<T> ? self.error : null;
  }
}
