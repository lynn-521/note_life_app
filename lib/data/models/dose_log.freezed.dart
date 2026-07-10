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

DoseLog _$DoseLogFromJson(Map<String, dynamic> json) {
  return _DoseLog.fromJson(json);
}

/// @nodoc
mixin _$DoseLog {
  String get id => throw _privateConstructorUsedError;
  String get medicationId => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  DoseStatus get status => throw _privateConstructorUsedError;
  DateTime? get takenAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this DoseLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseLogCopyWith<DoseLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseLogCopyWith<$Res> {
  factory $DoseLogCopyWith(DoseLog value, $Res Function(DoseLog) then) =
      _$DoseLogCopyWithImpl<$Res, DoseLog>;
  @useResult
  $Res call(
      {String id,
      String medicationId,
      String memberId,
      DateTime scheduledTime,
      DoseStatus status,
      DateTime? takenAt,
      String? note,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class _$DoseLogCopyWithImpl<$Res, $Val extends DoseLog>
    implements $DoseLogCopyWith<$Res> {
  _$DoseLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseLog
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
abstract class _$$DoseLogImplCopyWith<$Res> implements $DoseLogCopyWith<$Res> {
  factory _$$DoseLogImplCopyWith(
          _$DoseLogImpl value, $Res Function(_$DoseLogImpl) then) =
      __$$DoseLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String medicationId,
      String memberId,
      DateTime scheduledTime,
      DoseStatus status,
      DateTime? takenAt,
      String? note,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class __$$DoseLogImplCopyWithImpl<$Res>
    extends _$DoseLogCopyWithImpl<$Res, _$DoseLogImpl>
    implements _$$DoseLogImplCopyWith<$Res> {
  __$$DoseLogImplCopyWithImpl(
      _$DoseLogImpl _value, $Res Function(_$DoseLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseLog
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
      required this.scheduledTime,
      this.status = DoseStatus.pending,
      this.takenAt,
      this.note,
      required this.createdAt,
      required this.updatedAt,
      this.version = 1,
      this.deletedAt});

  factory _$DoseLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseLogImplFromJson(json);

  @override
  final String id;
  @override
  final String medicationId;
  @override
  final String memberId;
  @override
  final DateTime scheduledTime;
  @override
  @JsonKey()
  final DoseStatus status;
  @override
  final DateTime? takenAt;
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
    return 'DoseLog(id: $id, medicationId: $medicationId, memberId: $memberId, scheduledTime: $scheduledTime, status: $status, takenAt: $takenAt, note: $note, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
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

  /// Create a copy of DoseLog
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

abstract class _DoseLog implements DoseLog {
  const factory _DoseLog(
      {required final String id,
      required final String medicationId,
      required final String memberId,
      required final DateTime scheduledTime,
      final DoseStatus status,
      final DateTime? takenAt,
      final String? note,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int version,
      final DateTime? deletedAt}) = _$DoseLogImpl;

  factory _DoseLog.fromJson(Map<String, dynamic> json) = _$DoseLogImpl.fromJson;

  @override
  String get id;
  @override
  String get medicationId;
  @override
  String get memberId;
  @override
  DateTime get scheduledTime;
  @override
  DoseStatus get status;
  @override
  DateTime? get takenAt;
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

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseLogImplCopyWith<_$DoseLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
