// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemoModel _$MemoModelFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$MemoModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get dueAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @UtcDateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this MemoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoModelCopyWith<MemoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoModelCopyWith<$Res> {
  factory $MemoModelCopyWith(MemoModel value, $Res Function(MemoModel) then) =
      _$MemoModelCopyWithImpl<$Res, MemoModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String authorId,
      bool pinned,
      bool done,
      @UtcDateTimeConverter() DateTime? dueAt,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class _$MemoModelCopyWithImpl<$Res, $Val extends MemoModel>
    implements $MemoModelCopyWith<$Res> {
  _$MemoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? authorId = null,
    Object? pinned = null,
    Object? done = null,
    Object? dueAt = freezed,
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
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$MemoImplCopyWith<$Res> implements $MemoModelCopyWith<$Res> {
  factory _$$MemoImplCopyWith(
          _$MemoImpl value, $Res Function(_$MemoImpl) then) =
      __$$MemoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String authorId,
      bool pinned,
      bool done,
      @UtcDateTimeConverter() DateTime? dueAt,
      @UtcDateTimeConverter() DateTime createdAt,
      @UtcDateTimeConverter() DateTime updatedAt,
      int version,
      @UtcDateTimeConverter() DateTime? deletedAt});
}

/// @nodoc
class __$$MemoImplCopyWithImpl<$Res>
    extends _$MemoModelCopyWithImpl<$Res, _$MemoImpl>
    implements _$$MemoImplCopyWith<$Res> {
  __$$MemoImplCopyWithImpl(_$MemoImpl _value, $Res Function(_$MemoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? authorId = null,
    Object? pinned = null,
    Object? done = null,
    Object? dueAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$MemoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$MemoImpl implements _Memo {
  const _$MemoImpl(
      {required this.id,
      required this.title,
      this.body = '',
      required this.authorId,
      this.pinned = false,
      this.done = false,
      @UtcDateTimeConverter() this.dueAt,
      @UtcDateTimeConverter() required this.createdAt,
      @UtcDateTimeConverter() required this.updatedAt,
      this.version = 1,
      @UtcDateTimeConverter() this.deletedAt});

  factory _$MemoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String body;
  @override
  final String authorId;
  @override
  @JsonKey()
  final bool pinned;
  @override
  @JsonKey()
  final bool done;
  @override
  @UtcDateTimeConverter()
  final DateTime? dueAt;
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
    return 'MemoModel(id: $id, title: $title, body: $body, authorId: $authorId, pinned: $pinned, done: $done, dueAt: $dueAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.dueAt, dueAt) || other.dueAt == dueAt) &&
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
  int get hashCode => Object.hash(runtimeType, id, title, body, authorId,
      pinned, done, dueAt, createdAt, updatedAt, version, deletedAt);

  /// Create a copy of MemoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      __$$MemoImplCopyWithImpl<_$MemoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoImplToJson(
      this,
    );
  }
}

abstract class _Memo implements MemoModel {
  const factory _Memo(
      {required final String id,
      required final String title,
      final String body,
      required final String authorId,
      final bool pinned,
      final bool done,
      @UtcDateTimeConverter() final DateTime? dueAt,
      @UtcDateTimeConverter() required final DateTime createdAt,
      @UtcDateTimeConverter() required final DateTime updatedAt,
      final int version,
      @UtcDateTimeConverter() final DateTime? deletedAt}) = _$MemoImpl;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$MemoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get authorId;
  @override
  bool get pinned;
  @override
  bool get done;
  @override
  @UtcDateTimeConverter()
  DateTime? get dueAt;
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

  /// Create a copy of MemoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoImplCopyWith<_$MemoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
