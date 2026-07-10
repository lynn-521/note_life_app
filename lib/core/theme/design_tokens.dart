/// 设计令牌（DESIGN.md · Soft Warm 设计系统）
///
/// 所有颜色 / 圆角 / 间距 / 阴影常量集中在此文件，Widget 禁止硬编码 hex。
/// 运行时通过 [AppTheme]（ThemeExtension）注入，Widget 用 `AppTheme.of(context)` 取用。
import 'package:flutter/material.dart';

/// 颜色令牌（集中定义，供 [AppTheme] 与渐变构造使用）。
class AppColors {
  AppColors._();

  // —— Primary 珊瑚橙 ——
  static const Color primary = Color(0xFFFF7A59);
  static const Color primaryHover = Color(0xFFF9683F);
  static const Color primaryActive = Color(0xFFE8552E);
  static const Color primarySoft = Color(0xFFFFE8E0);
  static const Color primarySoft2 = Color(0xFFFFD9CC);
  static const Color primaryInk = Color(0xFFB23A1E);

  // —— Secondary 健康绿 ——
  static const Color secondary = Color(0xFF36C58A);
  static const Color secondaryHover = Color(0xFF2BAE78);
  static const Color secondarySoft = Color(0xFFDFF7EC);
  static const Color secondaryInk = Color(0xFF1B7A52);

  // —— Accent 点缀 ——
  static const Color sky = Color(0xFF4DA3FF);
  static const Color skySoft = Color(0xFFE3F1FF);
  static const Color skyInk = Color(0xFF1B66B3);
  static const Color sun = Color(0xFFF2C94C);
  static const Color sunSoft = Color(0xFFFFF3D1);
  static const Color sunInk = Color(0xFF8A5E00);
  static const Color berry = Color(0xFFFF7AA8);
  static const Color berrySoft = Color(0xFFFFE3EE);
  static const Color berryInk = Color(0xFFA82E5C);

  // —— Semantic ——
  static const Color danger = Color(0xFFFF5A5F);
  static const Color dangerSoft = Color(0xFFFFE3E4);
  static const Color dangerInk = Color(0xFFC2333A);
  static const Color warning = Color(0xFFFFB020);
  static const Color warningSoft = Color(0xFFFFF1D6);
  static const Color warningInk = Color(0xFF8A5E00);
  static const Color success = Color(0xFF36C58A);
  static const Color successSoft = Color(0xFFDFF7EC);
  static const Color successInk = Color(0xFF1B7A52);
  static const Color info = Color(0xFF4DA3FF);
  static const Color infoSoft = Color(0xFFE3F1FF);
  static const Color infoInk = Color(0xFF1B66B3);

  // —— Neutral ——
  static const Color bg = Color(0xFFFFF7F2);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surface2 = Color(0xFFFFF1EA);
  static const Color border = Color(0xFFF0E4DC);
  static const Color borderStrong = Color(0xFFE6D6CC);
  static const Color textPrimary = Color(0xFF2B2420);
  static const Color textSecondary = Color(0xFF6B5E56);
  static const Color textTertiary = Color(0xFF8A7D74);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFD9CFC8);
  static const Color disabledBg = Color(0xFFF3ECE7);

  // —— Gradient ——
  static const Gradient gradientHeader = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF7A59), Color(0xFFF2C94C)],
  );

  static const Gradient gradientHeaderSoft = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFE8E0), Color(0xFFFFF3D1)],
  );

  static const Gradient gradientPrimaryGlow = RadialGradient(
    center: Alignment(0, -1),
    radius: 1.2,
    colors: [Color(0xFFFFB38C), Color(0xFFFF7A59), Color(0xFFF9683F)],
  );
}

/// 间距令牌（4pt 基准）。
class AppSpacing {
  const AppSpacing({
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
  });

  factory AppSpacing.light() => const AppSpacing(
        s1: 4,
        s2: 8,
        s3: 12,
        s4: 16,
        s5: 24,
        s6: 32,
        s7: 48,
      );

  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s7;
}

/// 柔和投影令牌（暖近黑 43,36,32，低透明大模糊）。
class AppShadows {
  const AppShadows({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.primary,
    required this.press,
  });

  factory AppShadows.light() => const AppShadows(
        xs: BoxShadow(
          color: Color(0x0A2B2420),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
        sm: BoxShadow(
          color: Color(0x0F2B2420),
          blurRadius: 16,
          offset: Offset(0, 6),
        ),
        md: BoxShadow(
          color: Color(0x142B2420),
          blurRadius: 24,
          offset: Offset(0, 10),
        ),
        lg: BoxShadow(
          color: Color(0x1A2B2420),
          blurRadius: 40,
          offset: Offset(0, 16),
        ),
        primary: BoxShadow(
          color: Color(0x47FF7A59),
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
        press: BoxShadow(
          color: Color(0x1A2B2420),
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      );

  final BoxShadow xs;
  final BoxShadow sm;
  final BoxShadow md;
  final BoxShadow lg;
  final BoxShadow primary;
  final BoxShadow press;
}
