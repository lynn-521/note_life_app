// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelPlanModel _$TravelPlanModelFromJson(Map<String, dynamic> json) {
  return _TravelPlan.fromJson(json);
}

/// @nodoc
mixin _$TravelPlanModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get start => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get end => throw _privateConstructorUsedError;
  List<String> get memberIds => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this TravelPlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanModelCopyWith<TravelPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanModelCopyWith<$Res> {
  factory $TravelPlanModelCopyWith(
          TravelPlanModel value, $Res Function(TravelPlanModel) then) =
      _$TravelPlanModelCopyWithImpl<$Res, TravelPlanModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      @UtcDateTimeConverter() DateTime start,
      @UtcDateTimeConverter() DateTime end,
      List<String> memberIds,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$TravelPlanModelCopyWithImpl<$Res, $Val extends TravelPlanModel>
    implements $TravelPlanModelCopyWith<$Res> {
  _$TravelPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? memberIds = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberIds: null == memberIds
          ? _value.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$TravelPlanImplCopyWith<$Res>
    implements $TravelPlanModelCopyWith<$Res> {
  factory _$$TravelPlanImplCopyWith(
          _$TravelPlanImpl value, $Res Function(_$TravelPlanImpl) then) =
      __$$TravelPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @UtcDateTimeConverter() DateTime start,
      @UtcDateTimeConverter() DateTime end,
      List<String> memberIds,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$TravelPlanImplCopyWithImpl<$Res>
    extends _$TravelPlanModelCopyWithImpl<$Res, _$TravelPlanImpl>
    implements _$$TravelPlanImplCopyWith<$Res> {
  __$$TravelPlanImplCopyWithImpl(
      _$TravelPlanImpl _value, $Res Function(_$TravelPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? memberIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$TravelPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberIds: null == memberIds
          ? _value._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$TravelPlanImpl implements _TravelPlan {
  const _$TravelPlanImpl(
      {required this.id,
      required this.title,
      @UtcDateTimeConverter() required this.start,
      @UtcDateTimeConverter() required this.end,
      final List<String> memberIds = const <String>[],
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt})
      : _memberIds = memberIds;

  factory _$TravelPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @UtcDateTimeConverter()
  final DateTime start;
  @override
  @UtcDateTimeConverter()
  final DateTime end;
  final List<String> _memberIds;
  @override
  @JsonKey()
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

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
    return 'TravelPlanModel(id: $id, title: $title, start: $start, end: $end, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      start,
      end,
      const DeepCollectionEquality().hash(_memberIds),
      createdAt,
      updatedAt,
      version,
      deletedAt);

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanImplCopyWith<_$TravelPlanImpl> get copyWith =>
      __$$TravelPlanImplCopyWithImpl<_$TravelPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelPlanImplToJson(
      this,
    );
  }
}

abstract class _TravelPlan implements TravelPlanModel {
  const factory _TravelPlan(
      {required final String id,
      required final String title,
      @UtcDateTimeConverter() required final DateTime start,
      @UtcDateTimeConverter() required final DateTime end,
      final List<String> memberIds,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$TravelPlanImpl;

  factory _TravelPlan.fromJson(Map<String, dynamic> json) =
      _$TravelPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @UtcDateTimeConverter()
  DateTime get start;
  @override
  @UtcDateTimeConverter()
  DateTime get end;
  @override
  List<String> get memberIds;
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

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanImplCopyWith<_$TravelPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
