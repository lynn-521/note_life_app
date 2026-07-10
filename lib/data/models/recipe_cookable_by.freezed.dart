// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_cookable_by.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeCookableBy _$RecipeCookableByFromJson(Map<String, dynamic> json) {
  return _RecipeCookableBy.fromJson(json);
}

/// @nodoc
mixin _$RecipeCookableBy {
  String get recipeId => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;

  /// Serializes this RecipeCookableBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeCookableBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCookableByCopyWith<RecipeCookableBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCookableByCopyWith<$Res> {
  factory $RecipeCookableByCopyWith(
          RecipeCookableBy value, $Res Function(RecipeCookableBy) then) =
      _$RecipeCookableByCopyWithImpl<$Res, RecipeCookableBy>;
  @useResult
  $Res call({String recipeId, String memberId});
}

/// @nodoc
class _$RecipeCookableByCopyWithImpl<$Res, $Val extends RecipeCookableBy>
    implements $RecipeCookableByCopyWith<$Res> {
  _$RecipeCookableByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeCookableBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? memberId = null,
  }) {
    return _then(_value.copyWith(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeCookableByImplCopyWith<$Res>
    implements $RecipeCookableByCopyWith<$Res> {
  factory _$$RecipeCookableByImplCopyWith(_$RecipeCookableByImpl value,
          $Res Function(_$RecipeCookableByImpl) then) =
      __$$RecipeCookableByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipeId, String memberId});
}

/// @nodoc
class __$$RecipeCookableByImplCopyWithImpl<$Res>
    extends _$RecipeCookableByCopyWithImpl<$Res, _$RecipeCookableByImpl>
    implements _$$RecipeCookableByImplCopyWith<$Res> {
  __$$RecipeCookableByImplCopyWithImpl(_$RecipeCookableByImpl _value,
      $Res Function(_$RecipeCookableByImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeCookableBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = null,
    Object? memberId = null,
  }) {
    return _then(_$RecipeCookableByImpl(
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeCookableByImpl implements _RecipeCookableBy {
  const _$RecipeCookableByImpl(
      {required this.recipeId, required this.memberId});

  factory _$RecipeCookableByImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeCookableByImplFromJson(json);

  @override
  final String recipeId;
  @override
  final String memberId;

  @override
  String toString() {
    return 'RecipeCookableBy(recipeId: $recipeId, memberId: $memberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeCookableByImpl &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recipeId, memberId);

  /// Create a copy of RecipeCookableBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeCookableByImplCopyWith<_$RecipeCookableByImpl> get copyWith =>
      __$$RecipeCookableByImplCopyWithImpl<_$RecipeCookableByImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeCookableByImplToJson(
      this,
    );
  }
}

abstract class _RecipeCookableBy implements RecipeCookableBy {
  const factory _RecipeCookableBy(
      {required final String recipeId,
      required final String memberId}) = _$RecipeCookableByImpl;

  factory _RecipeCookableBy.fromJson(Map<String, dynamic> json) =
      _$RecipeCookableByImpl.fromJson;

  @override
  String get recipeId;
  @override
  String get memberId;

  /// Create a copy of RecipeCookableBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeCookableByImplCopyWith<_$RecipeCookableByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
