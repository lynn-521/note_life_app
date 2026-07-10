// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelItem _$TravelItemFromJson(Map<String, dynamic> json) {
  return _TravelItem.fromJson(json);
}

/// @nodoc
mixin _$TravelItem {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  TravelItemType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  num? get qty => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this TravelItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelItemCopyWith<TravelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelItemCopyWith<$Res> {
  factory $TravelItemCopyWith(
          TravelItem value, $Res Function(TravelItem) then) =
      _$TravelItemCopyWithImpl<$Res, TravelItem>;
  @useResult
  $Res call(
      {String id,
      String planId,
      TravelItemType type,
      String name,
      num? qty,
      num? amount,
      bool done,
      String? assignedTo,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class _$TravelItemCopyWithImpl<$Res, $Val extends TravelItem>
    implements $TravelItemCopyWith<$Res> {
  _$TravelItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? type = null,
    Object? name = null,
    Object? qty = freezed,
    Object? amount = freezed,
    Object? done = null,
    Object? assignedTo = freezed,
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
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelItemType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as num?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TravelItemImplCopyWith<$Res>
    implements $TravelItemCopyWith<$Res> {
  factory _$$TravelItemImplCopyWith(
          _$TravelItemImpl value, $Res Function(_$TravelItemImpl) then) =
      __$$TravelItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      TravelItemType type,
      String name,
      num? qty,
      num? amount,
      bool done,
      String? assignedTo,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class __$$TravelItemImplCopyWithImpl<$Res>
    extends _$TravelItemCopyWithImpl<$Res, _$TravelItemImpl>
    implements _$$TravelItemImplCopyWith<$Res> {
  __$$TravelItemImplCopyWithImpl(
      _$TravelItemImpl _value, $Res Function(_$TravelItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? type = null,
    Object? name = null,
    Object? qty = freezed,
    Object? amount = freezed,
    Object? done = null,
    Object? assignedTo = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$TravelItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelItemType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as num?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TravelItemImpl implements _TravelItem {
  const _$TravelItemImpl(
      {required this.id,
      required this.planId,
      this.type = TravelItemType.luggage,
      required this.name,
      this.qty,
      this.amount,
      this.done = false,
      this.assignedTo,
      required this.createdAt,
      required this.updatedAt,
      this.version = 1,
      this.deletedAt});

  factory _$TravelItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelItemImplFromJson(json);

  @override
  final String id;
  @override
  final String planId;
  @override
  @JsonKey()
  final TravelItemType type;
  @override
  final String name;
  @override
  final num? qty;
  @override
  final num? amount;
  @override
  @JsonKey()
  final bool done;
  @override
  final String? assignedTo;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int version;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'TravelItem(id: $id, planId: $planId, type: $type, name: $name, qty: $qty, amount: $amount, done: $done, assignedTo: $assignedTo, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
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
  int get hashCode => Object.hash(runtimeType, id, planId, type, name, qty,
      amount, done, assignedTo, createdAt, updatedAt, version, deletedAt);

  /// Create a copy of TravelItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelItemImplCopyWith<_$TravelItemImpl> get copyWith =>
      __$$TravelItemImplCopyWithImpl<_$TravelItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelItemImplToJson(
      this,
    );
  }
}

abstract class _TravelItem implements TravelItem {
  const factory _TravelItem(
      {required final String id,
      required final String planId,
      final TravelItemType type,
      required final String name,
      final num? qty,
      final num? amount,
      final bool done,
      final String? assignedTo,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int version,
      final DateTime? deletedAt}) = _$TravelItemImpl;

  factory _TravelItem.fromJson(Map<String, dynamic> json) =
      _$TravelItemImpl.fromJson;

  @override
  String get id;
  @override
  String get planId;
  @override
  TravelItemType get type;
  @override
  String get name;
  @override
  num? get qty;
  @override
  num? get amount;
  @override
  bool get done;
  @override
  String? get assignedTo;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get version;
  @override
  DateTime? get deletedAt;

  /// Create a copy of TravelItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelItemImplCopyWith<_$TravelItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
