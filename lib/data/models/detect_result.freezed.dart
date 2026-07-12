// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectBbox _$DetectBboxFromJson(Map<String, dynamic> json) {
  return _DetectBbox.fromJson(json);
}

/// @nodoc
mixin _$DetectBbox {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get w => throw _privateConstructorUsedError;
  double get h => throw _privateConstructorUsedError;

  /// Serializes this DetectBbox to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectBbox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectBboxCopyWith<DetectBbox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectBboxCopyWith<$Res> {
  factory $DetectBboxCopyWith(
          DetectBbox value, $Res Function(DetectBbox) then) =
      _$DetectBboxCopyWithImpl<$Res, DetectBbox>;
  @useResult
  $Res call({double x, double y, double w, double h});
}

/// @nodoc
class _$DetectBboxCopyWithImpl<$Res, $Val extends DetectBbox>
    implements $DetectBboxCopyWith<$Res> {
  _$DetectBboxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectBbox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? w = null,
    Object? h = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      w: null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as double,
      h: null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectBboxImplCopyWith<$Res>
    implements $DetectBboxCopyWith<$Res> {
  factory _$$DetectBboxImplCopyWith(
          _$DetectBboxImpl value, $Res Function(_$DetectBboxImpl) then) =
      __$$DetectBboxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, double w, double h});
}

/// @nodoc
class __$$DetectBboxImplCopyWithImpl<$Res>
    extends _$DetectBboxCopyWithImpl<$Res, _$DetectBboxImpl>
    implements _$$DetectBboxImplCopyWith<$Res> {
  __$$DetectBboxImplCopyWithImpl(
      _$DetectBboxImpl _value, $Res Function(_$DetectBboxImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectBbox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? w = null,
    Object? h = null,
  }) {
    return _then(_$DetectBboxImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      w: null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as double,
      h: null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectBboxImpl implements _DetectBbox {
  const _$DetectBboxImpl(
      {required this.x, required this.y, required this.w, required this.h});

  factory _$DetectBboxImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectBboxImplFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double w;
  @override
  final double h;

  @override
  String toString() {
    return 'DetectBbox(x: $x, y: $y, w: $w, h: $h)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectBboxImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.w, w) || other.w == w) &&
            (identical(other.h, h) || other.h == h));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, w, h);

  /// Create a copy of DetectBbox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectBboxImplCopyWith<_$DetectBboxImpl> get copyWith =>
      __$$DetectBboxImplCopyWithImpl<_$DetectBboxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectBboxImplToJson(
      this,
    );
  }
}

abstract class _DetectBbox implements DetectBbox {
  const factory _DetectBbox(
      {required final double x,
      required final double y,
      required final double w,
      required final double h}) = _$DetectBboxImpl;

  factory _DetectBbox.fromJson(Map<String, dynamic> json) =
      _$DetectBboxImpl.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get w;
  @override
  double get h;

  /// Create a copy of DetectBbox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectBboxImplCopyWith<_$DetectBboxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetectItem _$DetectItemFromJson(Map<String, dynamic> json) {
  return _DetectItem.fromJson(json);
}

/// @nodoc
mixin _$DetectItem {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get categoryHint => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  DetectBbox get bbox => throw _privateConstructorUsedError;

  /// Serializes this DetectItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectItemCopyWith<DetectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectItemCopyWith<$Res> {
  factory $DetectItemCopyWith(
          DetectItem value, $Res Function(DetectItem) then) =
      _$DetectItemCopyWithImpl<$Res, DetectItem>;
  @useResult
  $Res call(
      {String id,
      String label,
      String categoryHint,
      double confidence,
      DetectBbox bbox});

  $DetectBboxCopyWith<$Res> get bbox;
}

/// @nodoc
class _$DetectItemCopyWithImpl<$Res, $Val extends DetectItem>
    implements $DetectItemCopyWith<$Res> {
  _$DetectItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? categoryHint = null,
    Object? confidence = null,
    Object? bbox = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryHint: null == categoryHint
          ? _value.categoryHint
          : categoryHint // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as DetectBbox,
    ) as $Val);
  }

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetectBboxCopyWith<$Res> get bbox {
    return $DetectBboxCopyWith<$Res>(_value.bbox, (value) {
      return _then(_value.copyWith(bbox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectItemImplCopyWith<$Res>
    implements $DetectItemCopyWith<$Res> {
  factory _$$DetectItemImplCopyWith(
          _$DetectItemImpl value, $Res Function(_$DetectItemImpl) then) =
      __$$DetectItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String categoryHint,
      double confidence,
      DetectBbox bbox});

  @override
  $DetectBboxCopyWith<$Res> get bbox;
}

/// @nodoc
class __$$DetectItemImplCopyWithImpl<$Res>
    extends _$DetectItemCopyWithImpl<$Res, _$DetectItemImpl>
    implements _$$DetectItemImplCopyWith<$Res> {
  __$$DetectItemImplCopyWithImpl(
      _$DetectItemImpl _value, $Res Function(_$DetectItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? categoryHint = null,
    Object? confidence = null,
    Object? bbox = null,
  }) {
    return _then(_$DetectItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      categoryHint: null == categoryHint
          ? _value.categoryHint
          : categoryHint // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as DetectBbox,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectItemImpl implements _DetectItem {
  const _$DetectItemImpl(
      {required this.id,
      required this.label,
      required this.categoryHint,
      required this.confidence,
      required this.bbox});

  factory _$DetectItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectItemImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String categoryHint;
  @override
  final double confidence;
  @override
  final DetectBbox bbox;

  @override
  String toString() {
    return 'DetectItem(id: $id, label: $label, categoryHint: $categoryHint, confidence: $confidence, bbox: $bbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.categoryHint, categoryHint) ||
                other.categoryHint == categoryHint) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.bbox, bbox) || other.bbox == bbox));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, categoryHint, confidence, bbox);

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectItemImplCopyWith<_$DetectItemImpl> get copyWith =>
      __$$DetectItemImplCopyWithImpl<_$DetectItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectItemImplToJson(
      this,
    );
  }
}

abstract class _DetectItem implements DetectItem {
  const factory _DetectItem(
      {required final String id,
      required final String label,
      required final String categoryHint,
      required final double confidence,
      required final DetectBbox bbox}) = _$DetectItemImpl;

  factory _DetectItem.fromJson(Map<String, dynamic> json) =
      _$DetectItemImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get categoryHint;
  @override
  double get confidence;
  @override
  DetectBbox get bbox;

  /// Create a copy of DetectItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectItemImplCopyWith<_$DetectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetectResult _$DetectResultFromJson(Map<String, dynamic> json) {
  return _DetectResult.fromJson(json);
}

/// @nodoc
mixin _$DetectResult {
  String get imageId => throw _privateConstructorUsedError;
  List<DetectItem> get detections => throw _privateConstructorUsedError;

  /// Serializes this DetectResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectResultCopyWith<DetectResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectResultCopyWith<$Res> {
  factory $DetectResultCopyWith(
          DetectResult value, $Res Function(DetectResult) then) =
      _$DetectResultCopyWithImpl<$Res, DetectResult>;
  @useResult
  $Res call({String imageId, List<DetectItem> detections});
}

/// @nodoc
class _$DetectResultCopyWithImpl<$Res, $Val extends DetectResult>
    implements $DetectResultCopyWith<$Res> {
  _$DetectResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? detections = null,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      detections: null == detections
          ? _value.detections
          : detections // ignore: cast_nullable_to_non_nullable
              as List<DetectItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectResultImplCopyWith<$Res>
    implements $DetectResultCopyWith<$Res> {
  factory _$$DetectResultImplCopyWith(
          _$DetectResultImpl value, $Res Function(_$DetectResultImpl) then) =
      __$$DetectResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageId, List<DetectItem> detections});
}

/// @nodoc
class __$$DetectResultImplCopyWithImpl<$Res>
    extends _$DetectResultCopyWithImpl<$Res, _$DetectResultImpl>
    implements _$$DetectResultImplCopyWith<$Res> {
  __$$DetectResultImplCopyWithImpl(
      _$DetectResultImpl _value, $Res Function(_$DetectResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? detections = null,
  }) {
    return _then(_$DetectResultImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      detections: null == detections
          ? _value._detections
          : detections // ignore: cast_nullable_to_non_nullable
              as List<DetectItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectResultImpl implements _DetectResult {
  const _$DetectResultImpl(
      {required this.imageId, required final List<DetectItem> detections})
      : _detections = detections;

  factory _$DetectResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectResultImplFromJson(json);

  @override
  final String imageId;
  final List<DetectItem> _detections;
  @override
  List<DetectItem> get detections {
    if (_detections is EqualUnmodifiableListView) return _detections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detections);
  }

  @override
  String toString() {
    return 'DetectResult(imageId: $imageId, detections: $detections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectResultImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            const DeepCollectionEquality()
                .equals(other._detections, _detections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, imageId, const DeepCollectionEquality().hash(_detections));

  /// Create a copy of DetectResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectResultImplCopyWith<_$DetectResultImpl> get copyWith =>
      __$$DetectResultImplCopyWithImpl<_$DetectResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectResultImplToJson(
      this,
    );
  }
}

abstract class _DetectResult implements DetectResult {
  const factory _DetectResult(
      {required final String imageId,
      required final List<DetectItem> detections}) = _$DetectResultImpl;

  factory _DetectResult.fromJson(Map<String, dynamic> json) =
      _$DetectResultImpl.fromJson;

  @override
  String get imageId;
  @override
  List<DetectItem> get detections;

  /// Create a copy of DetectResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectResultImplCopyWith<_$DetectResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
