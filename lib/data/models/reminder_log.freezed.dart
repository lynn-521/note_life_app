// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderLogModel _$ReminderLogModelFromJson(Map<String, dynamic> json) {
  return _ReminderLog.fromJson(json);
}

/// @nodoc
mixin _$ReminderLogModel {
  String get id => throw _privateConstructorUsedError;
  String get ruleId => throw _privateConstructorUsedError;
  DateTime get firedAt => throw _privateConstructorUsedError;
  ChannelType get channel => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get payload => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderLogModelCopyWith<ReminderLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderLogModelCopyWith<$Res> {
  factory $ReminderLogModelCopyWith(
          ReminderLogModel value, $Res Function(ReminderLogModel) then) =
      _$ReminderLogModelCopyWithImpl<$Res, ReminderLogModel>;
  @useResult
  $Res call(
      {String id,
      String ruleId,
      DateTime firedAt,
      ChannelType channel,
      String status,
      String? payload,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class _$ReminderLogModelCopyWithImpl<$Res, $Val extends ReminderLogModel>
    implements $ReminderLogModelCopyWith<$Res> {
  _$ReminderLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ruleId = null,
    Object? firedAt = null,
    Object? channel = null,
    Object? status = null,
    Object? payload = freezed,
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
      ruleId: null == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      firedAt: null == firedAt
          ? _value.firedAt
          : firedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReminderLogImplCopyWith<$Res>
    implements $ReminderLogModelCopyWith<$Res> {
  factory _$$ReminderLogImplCopyWith(
          _$ReminderLogImpl value, $Res Function(_$ReminderLogImpl) then) =
      __$$ReminderLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ruleId,
      DateTime firedAt,
      ChannelType channel,
      String status,
      String? payload,
      DateTime createdAt,
      DateTime updatedAt,
      int version,
      DateTime? deletedAt});
}

/// @nodoc
class __$$ReminderLogImplCopyWithImpl<$Res>
    extends _$ReminderLogModelCopyWithImpl<$Res, _$ReminderLogImpl>
    implements _$$ReminderLogImplCopyWith<$Res> {
  __$$ReminderLogImplCopyWithImpl(
      _$ReminderLogImpl _value, $Res Function(_$ReminderLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ruleId = null,
    Object? firedAt = null,
    Object? channel = null,
    Object? status = null,
    Object? payload = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$ReminderLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ruleId: null == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      firedAt: null == firedAt
          ? _value.firedAt
          : firedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
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
class _$ReminderLogImpl implements _ReminderLog {
  const _$ReminderLogImpl(
      {required this.id,
      required this.ruleId,
      required this.firedAt,
      this.channel = ChannelType.localLog,
      this.status = 'pending',
      this.payload,
      required this.createdAt,
      required this.updatedAt,
      this.version = 1,
      this.deletedAt});

  factory _$ReminderLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderLogImplFromJson(json);

  @override
  final String id;
  @override
  final String ruleId;
  @override
  final DateTime firedAt;
  @override
  @JsonKey()
  final ChannelType channel;
  @override
  @JsonKey()
  final String status;
  @override
  final String? payload;
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
    return 'ReminderLogModel(id: $id, ruleId: $ruleId, firedAt: $firedAt, channel: $channel, status: $status, payload: $payload, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ruleId, ruleId) || other.ruleId == ruleId) &&
            (identical(other.firedAt, firedAt) || other.firedAt == firedAt) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payload, payload) || other.payload == payload) &&
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
  int get hashCode => Object.hash(runtimeType, id, ruleId, firedAt, channel,
      status, payload, createdAt, updatedAt, version, deletedAt);

  /// Create a copy of ReminderLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderLogImplCopyWith<_$ReminderLogImpl> get copyWith =>
      __$$ReminderLogImplCopyWithImpl<_$ReminderLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderLogImplToJson(
      this,
    );
  }
}

abstract class _ReminderLog implements ReminderLogModel {
  const factory _ReminderLog(
      {required final String id,
      required final String ruleId,
      required final DateTime firedAt,
      final ChannelType channel,
      final String status,
      final String? payload,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int version,
      final DateTime? deletedAt}) = _$ReminderLogImpl;

  factory _ReminderLog.fromJson(Map<String, dynamic> json) =
      _$ReminderLogImpl.fromJson;

  @override
  String get id;
  @override
  String get ruleId;
  @override
  DateTime get firedAt;
  @override
  ChannelType get channel;
  @override
  String get status;
  @override
  String? get payload;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get version;
  @override
  DateTime? get deletedAt;

  /// Create a copy of ReminderLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderLogImplCopyWith<_$ReminderLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
