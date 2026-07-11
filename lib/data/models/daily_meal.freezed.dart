// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyMealModel _$DailyMealModelFromJson(Map<String, dynamic> json) {
  return _DailyMeal.fromJson(json);
}

/// @nodoc
mixin _$DailyMealModel {
  String get id => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  MealType get mealType => throw _privateConstructorUsedError;
  String get recipeId => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this DailyMealModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMealModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMealModelCopyWith<DailyMealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMealModelCopyWith<$Res> {
  factory $DailyMealModelCopyWith(
          DailyMealModel value, $Res Function(DailyMealModel) then) =
      _$DailyMealModelCopyWithImpl<$Res, DailyMealModel>;
  @useResult
  $Res call(
      {String id,
      @UtcDateTimeConverter() DateTime date,
      MealType mealType,
      String recipeId,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$DailyMealModelCopyWithImpl<$Res, $Val extends DailyMealModel>
    implements $DailyMealModelCopyWith<$Res> {
  _$DailyMealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMealModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? mealType = null,
    Object? recipeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyMealImplCopyWith<$Res>
    implements $DailyMealModelCopyWith<$Res> {
  factory _$$DailyMealImplCopyWith(
          _$DailyMealImpl value, $Res Function(_$DailyMealImpl) then) =
      __$$DailyMealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @UtcDateTimeConverter() DateTime date,
      MealType mealType,
      String recipeId,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$DailyMealImplCopyWithImpl<$Res>
    extends _$DailyMealModelCopyWithImpl<$Res, _$DailyMealImpl>
    implements _$$DailyMealImplCopyWith<$Res> {
  __$$DailyMealImplCopyWithImpl(
      _$DailyMealImpl _value, $Res Function(_$DailyMealImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMealModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? mealType = null,
    Object? recipeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DailyMealImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      recipeId: null == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMealImpl implements _DailyMeal {
  const _$DailyMealImpl(
      {required this.id,
      @UtcDateTimeConverter() required this.date,
      required this.mealType,
      required this.recipeId,
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt});

  factory _$DailyMealImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMealImplFromJson(json);

  @override
  final String id;
  @override
  @UtcDateTimeConverter()
  final DateTime date;
  @override
  final MealType mealType;
  @override
  final String recipeId;
  @override
  @UtcDateTimeConverter()
  final DateTime createdAt;
  @override
  @UtcDateTimeConverter()
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int version;
  @override
  @UtcDateTimeConverter()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'DailyMealModel(id: $id, date: $date, mealType: $mealType, recipeId: $recipeId, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, mealType, recipeId,
      createdAt, updatedAt, version, deletedAt);

  /// Create a copy of DailyMealModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMealImplCopyWith<_$DailyMealImpl> get copyWith =>
      __$$DailyMealImplCopyWithImpl<_$DailyMealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMealImplToJson(
      this,
    );
  }
}

abstract class _DailyMeal implements DailyMealModel {
  const factory _DailyMeal(
      {required final String id,
      @UtcDateTimeConverter() required final DateTime date,
      required final MealType mealType,
      required final String recipeId,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$DailyMealImpl;

  factory _DailyMeal.fromJson(Map<String, dynamic> json) =
      _$DailyMealImpl.fromJson;

  @override
  String get id;
  @override
  @UtcDateTimeConverter()
  DateTime get date;
  @override
  MealType get mealType;
  @override
  String get recipeId;
  @override
  @UtcDateTimeConverter()
  DateTime get createdAt;
  @override
  @UtcDateTimeConverter()
  DateTime get updatedAt;
  @override
  int get version;
  @override
  @UtcDateTimeConverter()
  DateTime? get deletedAt;

  /// Create a copy of DailyMealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMealImplCopyWith<_$DailyMealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
