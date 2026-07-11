/// 字体阶梯（DESIGN.md §3 Typography）。
///
/// 中文圆体感展示 + 西文/数字圆润无衬线。未内置字体资源时优雅回退到系统圆体。
library;
import 'package:flutter/material.dart';

/// 字体栈名称（与 DESIGN.md 对齐；缺失时由 Flutter 回退）。
class AppFonts {
  AppFonts._();

  static const String display = 'ZCOOL KuaiLe';
  static const String sans = 'Nunito';
  static const String num = 'Baloo 2';
}

/// 字号阶梯（12/14/16/20/24/32/40）。
class AppTextStyles {
  AppTextStyles._();

  /// 展示体（屏标题 / 区块标题），中文圆体感。
  static TextStyle display(
    double size, {
    FontWeight weight = FontWeight.w700,
    Color? color,
    double? height,
  }) =>
      TextStyle(
        fontFamily: AppFonts.display,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  /// 正文 / 通用（圆润无衬线）。
  static TextStyle sans(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
  }) =>
      TextStyle(
        fontFamily: AppFonts.sans,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  /// 数据数字（圆润数字，放大带色）。
  static TextStyle num(
    double size, {
    FontWeight weight = FontWeight.w800,
    Color? color,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: AppFonts.num,
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing ?? 0.5,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  // —— 预定义字号阶梯 ——
  static TextStyle get xs => sans(12, weight: FontWeight.w500);
  static TextStyle get sm => sans(14);
  static TextStyle get base => sans(16);
  static TextStyle get md => display(20, weight: FontWeight.w600);
  static TextStyle get lg => display(24, weight: FontWeight.w700);
  static TextStyle get xl => display(32, weight: FontWeight.w700);
  static TextStyle get xl2 => display(40, weight: FontWeight.w700);

  /// 数据强调样式（库存/天数放大 + 主色）。
  static TextStyle dataNum(double size, {Color? color}) =>
      num(size, color: color);
}
