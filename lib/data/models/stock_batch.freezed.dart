// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockBatchModel _$StockBatchModelFromJson(Map<String, dynamic> json) {
  return _StockBatch.fromJson(json);
}

/// @nodoc
mixin _$StockBatchModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  num get quantity => throw _privateConstructorUsedError;
  DateTime? get expireDate => throw _privateConstructorUsedError;
  String? get batchNo => throw _privateConstructorUsedError;
  DateTime get inboundAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this StockBatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockBatchModelCopyWith<StockBatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockBatchModelCopyWith<$Res> {
  factory $StockBatchModelCopyWith(
          StockBatchModel value, $Res Function(StockBatchModel) then) =
      _$StockBatchModelCopyWithImpl<$Res, StockBatchModel>;
  @useResult
  $Res call(
      {String id,
      String productId,
      num quantity,
      DateTime? expireDate,
      String? batchNo,
      DateTime inboundAt,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class _$StockBatchModelCopyWithImpl<$Res, $Val extends StockBatchModel>
    implements $StockBatchModelCopyWith<$Res> {
  _$StockBatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? quantity = null,
    Object? expireDate = freezed,
    Object? batchNo = freezed,
    Object? inboundAt = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      inboundAt: null == inboundAt
          ? _value.inboundAt
          : inboundAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$StockBatchImplCopyWith<$Res>
    implements $StockBatchModelCopyWith<$Res> {
  factory _$$StockBatchImplCopyWith(
          _$StockBatchImpl value, $Res Function(_$StockBatchImpl) then) =
      __$$StockBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      num quantity,
      DateTime? expireDate,
      String? batchNo,
      DateTime inboundAt,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class __$$StockBatchImplCopyWithImpl<$Res>
    extends _$StockBatchModelCopyWithImpl<$Res, _$StockBatchImpl>
    implements _$$StockBatchImplCopyWith<$Res> {
  __$$StockBatchImplCopyWithImpl(
      _$StockBatchImpl _value, $Res Function(_$StockBatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? quantity = null,
    Object? expireDate = freezed,
    Object? batchNo = freezed,
    Object? inboundAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$StockBatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      inboundAt: null == inboundAt
          ? _value.inboundAt
          : inboundAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$StockBatchImpl implements _StockBatch {
  const _$StockBatchImpl(
      {required this.id,
      required this.productId,
      required this.quantity,
      this.expireDate,
      this.batchNo,
      required this.inboundAt,
      required this.createdAt,
      required this.updatedAt,
      this.version = 1,
      this.deletedAt});

  factory _$StockBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockBatchImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final num quantity;
  @override
  final DateTime? expireDate;
  @override
  final String? batchNo;
  @override
  final DateTime inboundAt;
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
    return 'StockBatchModel(id: $id, productId: $productId, quantity: $quantity, expireDate: $expireDate, batchNo: $batchNo, inboundAt: $inboundAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockBatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.inboundAt, inboundAt) ||
                other.inboundAt == inboundAt) &&
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
  int get hashCode => Object.hash(runtimeType, id, productId, quantity,
      expireDate, batchNo, inboundAt, createdAt, updatedAt, version, deletedAt);

  /// Create a copy of StockBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockBatchImplCopyWith<_$StockBatchImpl> get copyWith =>
      __$$StockBatchImplCopyWithImpl<_$StockBatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockBatchImplToJson(
      this,
    );
  }
}

abstract class _StockBatch implements StockBatchModel {
  const factory _StockBatch(
      {required final String id,
      required final String productId,
      required final num quantity,
      final DateTime? expireDate,
      final String? batchNo,
      required final DateTime inboundAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int version,
      final DateTime? deletedAt}) = _$StockBatchImpl;

  factory _StockBatch.fromJson(Map<String, dynamic> json) =
      _$StockBatchImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  num get quantity;
  @override
  DateTime? get expireDate;
  @override
  String? get batchNo;
  @override
  DateTime get inboundAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get version;
  @override
  DateTime? get deletedAt;

  /// Create a copy of StockBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockBatchImplCopyWith<_$StockBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
