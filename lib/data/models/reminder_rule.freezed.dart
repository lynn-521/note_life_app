// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderRuleModel _$ReminderRuleModelFromJson(Map<String, dynamic> json) {
  return _ReminderRule.fromJson(json);
}

/// @nodoc
mixin _$ReminderRuleModel {
  String get id => throw _privateConstructorUsedError;
  ReminderType get type => throw _privateConstructorUsedError;
  String get sourceRef => throw _privateConstructorUsedError;
  ChannelType get channel => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String? get memberId => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderRuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderRuleModelCopyWith<ReminderRuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderRuleModelCopyWith<$Res> {
  factory $ReminderRuleModelCopyWith(
          ReminderRuleModel value, $Res Function(ReminderRuleModel) then) =
      _$ReminderRuleModelCopyWithImpl<$Res, ReminderRuleModel>;
  @useResult
  $Res call(
      {String id,
      ReminderType type,
      String sourceRef,
      ChannelType channel,
      Map<String, dynamic> config,
      String? memberId,
      bool enabled,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$ReminderRuleModelCopyWithImpl<$Res, $Val extends ReminderRuleModel>
    implements $ReminderRuleModelCopyWith<$Res> {
  _$ReminderRuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? sourceRef = null,
    Object? channel = null,
    Object? config = null,
    Object? memberId = freezed,
    Object? enabled = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      sourceRef: null == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelType,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ReminderRuleImplCopyWith<$Res>
    implements $ReminderRuleModelCopyWith<$Res> {
  factory _$$ReminderRuleImplCopyWith(
          _$ReminderRuleImpl value, $Res Function(_$ReminderRuleImpl) then) =
      __$$ReminderRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ReminderType type,
      String sourceRef,
      ChannelType channel,
      Map<String, dynamic> config,
      String? memberId,
      bool enabled,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$ReminderRuleImplCopyWithImpl<$Res>
    extends _$ReminderRuleModelCopyWithImpl<$Res, _$ReminderRuleImpl>
    implements _$$ReminderRuleImplCopyWith<$Res> {
  __$$ReminderRuleImplCopyWithImpl(
      _$ReminderRuleImpl _value, $Res Function(_$ReminderRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? sourceRef = null,
    Object? channel = null,
    Object? config = null,
    Object? memberId = freezed,
    Object? enabled = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$ReminderRuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      sourceRef: null == sourceRef
          ? _value.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelType,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$ReminderRuleImpl implements _ReminderRule {
  const _$ReminderRuleImpl(
      {required this.id,
      required this.type,
      required this.sourceRef,
      this.channel = ChannelType.localLog,
      final Map<String, dynamic> config = const <String, dynamic>{},
      this.memberId,
      this.enabled = true,
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt})
      : _config = config;

  factory _$ReminderRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderRuleImplFromJson(json);

  @override
  final String id;
  @override
  final ReminderType type;
  @override
  final String sourceRef;
  @override
  @JsonKey()
  final ChannelType channel;
  final Map<String, dynamic> _config;
  @override
  @JsonKey()
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String? memberId;
  @override
  @JsonKey()
  final bool enabled;
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
    return 'ReminderRuleModel(id: $id, type: $type, sourceRef: $sourceRef, channel: $channel, config: $config, memberId: $memberId, enabled: $enabled, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sourceRef, sourceRef) ||
                other.sourceRef == sourceRef) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
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
      type,
      sourceRef,
      channel,
      const DeepCollectionEquality().hash(_config),
      memberId,
      enabled,
      createdAt,
      updatedAt,
      version,
      deletedAt);

  /// Create a copy of ReminderRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderRuleImplCopyWith<_$ReminderRuleImpl> get copyWith =>
      __$$ReminderRuleImplCopyWithImpl<_$ReminderRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderRuleImplToJson(
      this,
    );
  }
}

abstract class _ReminderRule implements ReminderRuleModel {
  const factory _ReminderRule(
      {required final String id,
      required final ReminderType type,
      required final String sourceRef,
      final ChannelType channel,
      final Map<String, dynamic> config,
      final String? memberId,
      final bool enabled,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$ReminderRuleImpl;

  factory _ReminderRule.fromJson(Map<String, dynamic> json) =
      _$ReminderRuleImpl.fromJson;

  @override
  String get id;
  @override
  ReminderType get type;
  @override
  String get sourceRef;
  @override
  ChannelType get channel;
  @override
  Map<String, dynamic> get config;
  @override
  String? get memberId;
  @override
  bool get enabled;
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

  /// Create a copy of ReminderRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderRuleImplCopyWith<_$ReminderRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
