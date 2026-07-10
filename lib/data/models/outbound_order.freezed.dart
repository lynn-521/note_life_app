// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outbound_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutboundOrder _$OutboundOrderFromJson(Map<String, dynamic> json) {
  return _OutboundOrder.fromJson(json);
}

/// @nodoc
mixin _$OutboundOrder {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  num get qty => throw _privateConstructorUsedError;
  OutboundReason get reason => throw _privateConstructorUsedError;
  String get operatorId => throw _privateConstructorUsedError;
  DateTime get at => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this OutboundOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutboundOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutboundOrderCopyWith<OutboundOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboundOrderCopyWith<$Res> {
  factory $OutboundOrderCopyWith(
          OutboundOrder value, $Res Function(OutboundOrder) then) =
      _$OutboundOrderCopyWithImpl<$Res, OutboundOrder>;
  @useResult
  $Res call(
      {String id,
      String productId,
      num qty,
      OutboundReason reason,
      String operatorId,
      DateTime at,
      String? note,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class _$OutboundOrderCopyWithImpl<$Res, $Val extends OutboundOrder>
    implements $OutboundOrderCopyWith<$Res> {
  _$OutboundOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboundOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? qty = null,
    Object? reason = null,
    Object? operatorId = null,
    Object? at = null,
    Object? note = freezed,
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
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as num,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as OutboundReason,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OutboundOrderImplCopyWith<$Res>
    implements $OutboundOrderCopyWith<$Res> {
  factory _$$OutboundOrderImplCopyWith(
          _$OutboundOrderImpl value, $Res Function(_$OutboundOrderImpl) then) =
      __$$OutboundOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      num qty,
      OutboundReason reason,
      String operatorId,
      DateTime at,
      String? note,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class __$$OutboundOrderImplCopyWithImpl<$Res>
    extends _$OutboundOrderCopyWithImpl<$Res, _$OutboundOrderImpl>
    implements _$$OutboundOrderImplCopyWith<$Res> {
  __$$OutboundOrderImplCopyWithImpl(
      _$OutboundOrderImpl _value, $Res Function(_$OutboundOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboundOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? qty = null,
    Object? reason = null,
    Object? operatorId = null,
    Object? at = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$OutboundOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as num,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as OutboundReason,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
class _$OutboundOrderImpl implements _OutboundOrder {
  const _$OutboundOrderImpl(
      {required this.id,
      required this.productId,
      required this.qty,
      this.reason = OutboundReason.consume,
      required this.operatorId,
      required this.at,
      this.note,
      required this.createdAt,
      required this.updatedAt,
      this.version = 1,
      this.deletedAt});

  factory _$OutboundOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutboundOrderImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final num qty;
  @override
  @JsonKey()
  final OutboundReason reason;
  @override
  final String operatorId;
  @override
  final DateTime at;
  @override
  final String? note;
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
    return 'OutboundOrder(id: $id, productId: $productId, qty: $qty, reason: $reason, operatorId: $operatorId, at: $at, note: $note, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutboundOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.note, note) || other.note == note) &&
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
  int get hashCode => Object.hash(runtimeType, id, productId, qty, reason,
      operatorId, at, note, createdAt, updatedAt, version, deletedAt);

  /// Create a copy of OutboundOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutboundOrderImplCopyWith<_$OutboundOrderImpl> get copyWith =>
      __$$OutboundOrderImplCopyWithImpl<_$OutboundOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutboundOrderImplToJson(
      this,
    );
  }
}

abstract class _OutboundOrder implements OutboundOrder {
  const factory _OutboundOrder(
      {required final String id,
      required final String productId,
      required final num qty,
      final OutboundReason reason,
      required final String operatorId,
      required final DateTime at,
      final String? note,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int version,
      final DateTime? deletedAt}) = _$OutboundOrderImpl;

  factory _OutboundOrder.fromJson(Map<String, dynamic> json) =
      _$OutboundOrderImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  num get qty;
  @override
  OutboundReason get reason;
  @override
  String get operatorId;
  @override
  DateTime get at;
  @override
  String? get note;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get version;
  @override
  DateTime? get deletedAt;

  /// Create a copy of OutboundOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutboundOrderImplCopyWith<_$OutboundOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
