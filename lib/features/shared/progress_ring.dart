/// 进度环组件（DESIGN.md §4 Progress Ring）。服药打卡 / 临期倒计时。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';

/// 环形进度：轨道浅底 + 进度主色，进度满转成功绿。
class ProgressRing extends StatelessWidget {
  /// 构造。
  const ProgressRing({
    super.key,
    required this.progress,
    this.size,
    this.strokeWidth,
    this.color,
    this.trackColor,
    this.center,
  });

  /// 进度 0..1。
  final double progress;

  /// 直径（默认取主题 ringSize）。
  final double? size;

  /// 线宽（默认取主题 ringStrokeWidth）。
  final double? strokeWidth;

  /// 进度色（默认主题主色；满进度时由调用方传 success）。
  final Color? color;

  /// 轨道色（默认主题 ringTrack）。
  final Color? trackColor;

  /// 圆心内容（如「1/3」）。
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final d = size ?? theme.ringSize;
    final sw = strokeWidth ?? theme.ringStrokeWidth;
    final clamped = progress.clamp(0.0, 1.0);
    final ringColor = color ?? (clamped >= 1 ? theme.success : theme.primary);

    return SizedBox(
      width: d,
      height: d,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: clamped,
            strokeWidth: sw,
            color: ringColor,
            backgroundColor: trackColor ?? theme.ringTrack,
          ),
          if (center != null) center!,
        ],
      ),
    );
  }
}
