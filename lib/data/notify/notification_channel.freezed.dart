// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendResult {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendResultCopyWith<SendResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendResultCopyWith<$Res> {
  factory $SendResultCopyWith(
          SendResult value, $Res Function(SendResult) then) =
      _$SendResultCopyWithImpl<$Res, SendResult>;
  @useResult
  $Res call({bool success, String? message, String? failureReason});
}

/// @nodoc
class _$SendResultCopyWithImpl<$Res, $Val extends SendResult>
    implements $SendResultCopyWith<$Res> {
  _$SendResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendResultImplCopyWith<$Res>
    implements $SendResultCopyWith<$Res> {
  factory _$$SendResultImplCopyWith(
          _$SendResultImpl value, $Res Function(_$SendResultImpl) then) =
      __$$SendResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, String? failureReason});
}

/// @nodoc
class __$$SendResultImplCopyWithImpl<$Res>
    extends _$SendResultCopyWithImpl<$Res, _$SendResultImpl>
    implements _$$SendResultImplCopyWith<$Res> {
  __$$SendResultImplCopyWithImpl(
      _$SendResultImpl _value, $Res Function(_$SendResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(_$SendResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendResultImpl implements _SendResult {
  const _$SendResultImpl(
      {required this.success, this.message, this.failureReason});

  @override
  final bool success;
  @override
  final String? message;
  @override
  final String? failureReason;

  @override
  String toString() {
    return 'SendResult(success: $success, message: $message, failureReason: $failureReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, message, failureReason);

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendResultImplCopyWith<_$SendResultImpl> get copyWith =>
      __$$SendResultImplCopyWithImpl<_$SendResultImpl>(this, _$identity);
}

abstract class _SendResult implements SendResult {
  const factory _SendResult(
      {required final bool success,
      final String? message,
      final String? failureReason}) = _$SendResultImpl;

  @override
  bool get success;
  @override
  String? get message;
  @override
  String? get failureReason;

  /// Create a copy of SendResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendResultImplCopyWith<_$SendResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
