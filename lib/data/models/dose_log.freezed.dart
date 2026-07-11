// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dose_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoseLogModel _$DoseLogModelFromJson(Map<String, dynamic> json) {
  return _DoseLog.fromJson(json);
}

/// @nodoc
mixin _$DoseLogModel {
  String get id => throw _privateConstructorUsedError;
  String get medicationId => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  DoseStatus get status => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get takenAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this DoseLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseLogModelCopyWith<DoseLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseLogModelCopyWith<$Res> {
  factory $DoseLogModelCopyWith(
          DoseLogModel value, $Res Function(DoseLogModel) then) =
      _$DoseLogModelCopyWithImpl<$Res, DoseLogModel>;
  @useResult
  $Res call(
      {String id,
      String medicationId,
      String memberId,
      @UtcDateTimeConverter() DateTime scheduledTime,
      DoseStatus status,
      @UtcDateTimeConverter() DateTime? takenAt,
      String? note,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$DoseLogModelCopyWithImpl<$Res, $Val extends DoseLogModel>
    implements $DoseLogModelCopyWith<$Res> {
  _$DoseLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? memberId = null,
    Object? scheduledTime = null,
    Object? status = null,
    Object? takenAt = freezed,
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
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DoseStatus,
      takenAt: freezed == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$DoseLogImplCopyWith<$Res>
    implements $DoseLogModelCopyWith<$Res> {
  factory _$$DoseLogImplCopyWith(
          _$DoseLogImpl value, $Res Function(_$DoseLogImpl) then) =
      __$$DoseLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String medicationId,
      String memberId,
      @UtcDateTimeConverter() DateTime scheduledTime,
      DoseStatus status,
      @UtcDateTimeConverter() DateTime? takenAt,
      String? note,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$DoseLogImplCopyWithImpl<$Res>
    extends _$DoseLogModelCopyWithImpl<$Res, _$DoseLogImpl>
    implements _$$DoseLogImplCopyWith<$Res> {
  __$$DoseLogImplCopyWithImpl(
      _$DoseLogImpl _value, $Res Function(_$DoseLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? memberId = null,
    Object? scheduledTime = null,
    Object? status = null,
    Object? takenAt = freezed,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DoseLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DoseStatus,
      takenAt: freezed == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$DoseLogImpl implements _DoseLog {
  const _$DoseLogImpl(
      {required this.id,
      required this.medicationId,
      required this.memberId,
      @UtcDateTimeConverter() required this.scheduledTime,
      this.status = DoseStatus.pending,
      @UtcDateTimeConverter() this.takenAt,
      this.note,
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt});

  factory _$DoseLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseLogImplFromJson(json);

  @override
  final String id;
  @override
  final String medicationId;
  @override
  final String memberId;
  @override
  @UtcDateTimeConverter()
  final DateTime scheduledTime;
  @override
  @JsonKey()
  final DoseStatus status;
  @override
  @UtcDateTimeConverter()
  final DateTime? takenAt;
  @override
  final String? note;
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
    return 'DoseLogModel(id: $id, medicationId: $medicationId, memberId: $memberId, scheduledTime: $scheduledTime, status: $status, takenAt: $takenAt, note: $note, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicationId, medicationId) ||
                other.medicationId == medicationId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.takenAt, takenAt) || other.takenAt == takenAt) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      medicationId,
      memberId,
      scheduledTime,
      status,
      takenAt,
      note,
      createdAt,
      updatedAt,
      version,
      deletedAt);

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseLogImplCopyWith<_$DoseLogImpl> get copyWith =>
      __$$DoseLogImplCopyWithImpl<_$DoseLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseLogImplToJson(
      this,
    );
  }
}

abstract class _DoseLog implements DoseLogModel {
  const factory _DoseLog(
      {required final String id,
      required final String medicationId,
      required final String memberId,
      @UtcDateTimeConverter() required final DateTime scheduledTime,
      final DoseStatus status,
      @UtcDateTimeConverter() final DateTime? takenAt,
      final String? note,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$DoseLogImpl;

  factory _DoseLog.fromJson(Map<String, dynamic> json) = _$DoseLogImpl.fromJson;

  @override
  String get id;
  @override
  String get medicationId;
  @override
  String get memberId;
  @override
  @UtcDateTimeConverter()
  DateTime get scheduledTime;
  @override
  DoseStatus get status;
  @override
  @UtcDateTimeConverter()
  DateTime? get takenAt;
  @override
  String? get note;
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

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseLogImplCopyWith<_$DoseLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
