// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicationModel _$MedicationModelFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$MedicationModel {
  String get id => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MedicationType get type => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  Frequency get frequency => throw _privateConstructorUsedError;
  @TimeOfDayListConverter()
  List<TimeOfDay> get times => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this MedicationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationModelCopyWith<MedicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationModelCopyWith<$Res> {
  factory $MedicationModelCopyWith(
          MedicationModel value, $Res Function(MedicationModel) then) =
      _$MedicationModelCopyWithImpl<$Res, MedicationModel>;
  @useResult
  $Res call(
      {String id,
      String memberId,
      String name,
      MedicationType type,
      String dosage,
      Frequency frequency,
      @TimeOfDayListConverter() List<TimeOfDay> times,
      @UtcDateTimeConverter() DateTime? startDate,
      @UtcDateTimeConverter() DateTime? endDate,
      bool active,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$MedicationModelCopyWithImpl<$Res, $Val extends MedicationModel>
    implements $MedicationModelCopyWith<$Res> {
  _$MedicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memberId = null,
    Object? name = null,
    Object? type = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? active = null,
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
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicationType,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationModelCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
          _$MedicationImpl value, $Res Function(_$MedicationImpl) then) =
      __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String memberId,
      String name,
      MedicationType type,
      String dosage,
      Frequency frequency,
      @TimeOfDayListConverter() List<TimeOfDay> times,
      @UtcDateTimeConverter() DateTime? startDate,
      @UtcDateTimeConverter() DateTime? endDate,
      bool active,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationModelCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
      _$MedicationImpl _value, $Res Function(_$MedicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memberId = null,
    Object? name = null,
    Object? type = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? times = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? active = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$MedicationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicationType,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      times: null == times
          ? _value._times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
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
class _$MedicationImpl implements _Medication {
  const _$MedicationImpl(
      {required this.id,
      required this.memberId,
      required this.name,
      this.type = MedicationType.medicine,
      required this.dosage,
      this.frequency = Frequency.dailyN,
      @TimeOfDayListConverter() required final List<TimeOfDay> times,
      @UtcDateTimeConverter() this.startDate,
      @UtcDateTimeConverter() this.endDate,
      this.active = true,
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt})
      : _times = times;

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final String id;
  @override
  final String memberId;
  @override
  final String name;
  @override
  @JsonKey()
  final MedicationType type;
  @override
  final String dosage;
  @override
  @JsonKey()
  final Frequency frequency;
  final List<TimeOfDay> _times;
  @override
  @TimeOfDayListConverter()
  List<TimeOfDay> get times {
    if (_times is EqualUnmodifiableListView) return _times;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_times);
  }

  @override
  @UtcDateTimeConverter()
  final DateTime? startDate;
  @override
  @UtcDateTimeConverter()
  final DateTime? endDate;
  @override
  @JsonKey()
  final bool active;
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
    return 'MedicationModel(id: $id, memberId: $memberId, name: $name, type: $type, dosage: $dosage, frequency: $frequency, times: $times, startDate: $startDate, endDate: $endDate, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality().equals(other._times, _times) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.active, active) || other.active == active) &&
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
      memberId,
      name,
      type,
      dosage,
      frequency,
      const DeepCollectionEquality().hash(_times),
      startDate,
      endDate,
      active,
      createdAt,
      updatedAt,
      version,
      deletedAt);

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(
      this,
    );
  }
}

abstract class _Medication implements MedicationModel {
  const factory _Medication(
      {required final String id,
      required final String memberId,
      required final String name,
      final MedicationType type,
      required final String dosage,
      final Frequency frequency,
      @TimeOfDayListConverter() required final List<TimeOfDay> times,
      @UtcDateTimeConverter() final DateTime? startDate,
      @UtcDateTimeConverter() final DateTime? endDate,
      final bool active,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$MedicationImpl;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  String get id;
  @override
  String get memberId;
  @override
  String get name;
  @override
  MedicationType get type;
  @override
  String get dosage;
  @override
  Frequency get frequency;
  @override
  @TimeOfDayListConverter()
  List<TimeOfDay> get times;
  @override
  @UtcDateTimeConverter()
  DateTime? get startDate;
  @override
  @UtcDateTimeConverter()
  DateTime? get endDate;
  @override
  bool get active;
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

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
