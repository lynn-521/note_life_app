/// 拍照入库多物识别响应模型（对应后端 POST /inbound/detect）。
///
/// 字段命名严格 camelCase（与后端 `note_life_backend/app/inbound_detect.py`
/// stub 输出对齐；see `note_life_backend/docs/inbound-detect.md` §1.3）。
///
/// `bbox` 是**相对坐标 [0, 1]**：前端拿到图片实际宽高后用
/// `Rect.fromLTWH(x * W, y * H, w * W, h * H)` 反算绝对像素。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detect_result.freezed.dart';
part 'detect_result.g.dart';

/// 单个 detection 的 bbox（归一化相对坐标）。
@freezed
class DetectBbox with _$DetectBbox {
  /// 构造。
  const factory DetectBbox({
    required double x,
    required double y,
    required double w,
    required double h,
  }) = _DetectBbox;

  /// 从后端 JSON 反序列化。
  factory DetectBbox.fromJson(Map<String, dynamic> json) =>
      _$DetectBboxFromJson(json);
}

/// 单个检测候选（来自 stub / 未来 LLM）。
@freezed
class DetectItem with _$DetectItem {
  /// 构造。
  const factory DetectItem({
    required String id,
    required String label,
    required String categoryHint,
    required double confidence,
    required DetectBbox bbox,
  }) = _DetectItem;

  /// 从后端 JSON 反序列化。
  factory DetectItem.fromJson(Map<String, dynamic> json) =>
      _$DetectItemFromJson(json);
}

/// 整次识别的响应（imageId + detections 列表）。
@freezed
class DetectResult with _$DetectResult {
  /// 构造。
  const factory DetectResult({
    required String imageId,
    required List<DetectItem> detections,
  }) = _DetectResult;

  /// 从后端 JSON 反序列化。
  factory DetectResult.fromJson(Map<String, dynamic> json) =>
      _$DetectResultFromJson(json);
}
