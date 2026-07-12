// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectBboxImpl _$$DetectBboxImplFromJson(Map<String, dynamic> json) =>
    _$DetectBboxImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      w: (json['w'] as num).toDouble(),
      h: (json['h'] as num).toDouble(),
    );

Map<String, dynamic> _$$DetectBboxImplToJson(_$DetectBboxImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'w': instance.w,
      'h': instance.h,
    };

_$DetectItemImpl _$$DetectItemImplFromJson(Map<String, dynamic> json) =>
    _$DetectItemImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      categoryHint: json['categoryHint'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      bbox: DetectBbox.fromJson(json['bbox'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetectItemImplToJson(_$DetectItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'categoryHint': instance.categoryHint,
      'confidence': instance.confidence,
      'bbox': instance.bbox.toJson(),
    };

_$DetectResultImpl _$$DetectResultImplFromJson(Map<String, dynamic> json) =>
    _$DetectResultImpl(
      imageId: json['imageId'] as String,
      detections: (json['detections'] as List<dynamic>)
          .map((e) => DetectItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetectResultImplToJson(_$DetectResultImpl instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'detections': instance.detections.map((e) => e.toJson()).toList(),
    };
