/// 统一异步状态 [AsyncState<T>]（system_design §7.5）。
///
/// 复杂联合态（idle/loading/data/error）统一在此，避免各页面重复写三态。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

/// 异步 UI 状态机。
@freezed
class AsyncState<T> with _$AsyncState<T> {
  /// 初始空闲（尚未加载）。
  const factory AsyncState.idle() = _Idle<T>;

  /// 加载中。
  const factory AsyncState.loading() = _Loading<T>;

  /// 已加载数据。
  const factory AsyncState.data(T data) = _Data<T>;

  /// 失败（携带错误）。
  const factory AsyncState.error(Object error) = _ErrorState<T>;

  const AsyncState._();

  /// 是否空闲。
  bool get isIdle => this is _Idle<T>;

  /// 是否加载中。
  bool get isLoading => this is _Loading<T>;

  /// 是否成功。
  bool get isData => this is _Data<T>;

  /// 是否失败。
  bool get isError => this is _ErrorState<T>;

  /// 取数据（非 data 时为 null）。
  T? get dataOrNull {
    final self = this;
    return self is _Data<T> ? self.data : null;
  }
}
