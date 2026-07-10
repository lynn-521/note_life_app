/// 自定义 [ThemeExtension<AppTheme>]：承载 DESIGN.md 中无法进 [ColorScheme] 的令牌。
///
/// 用法：
/// ```dart
/// final theme = AppTheme.of(context);
/// Container(decoration: BoxDecoration(color: theme.primarySoft, borderRadius: theme.radiusCard));
/// ```
import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// 应用主题扩展（Soft Warm 设计系统）。
class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.primary,
    required this.primaryHover,
    required this.primaryActive,
    required this.primarySoft,
    required this.primarySoft2,
    required this.primaryInk,
    required this.secondary,
    required this.secondarySoft,
    required this.secondaryInk,
    required this.sky,
    required this.skySoft,
    required this.skyInk,
    required this.sun,
    required this.sunSoft,
    required this.sunInk,
    required this.berry,
    required this.berrySoft,
    required this.berryInk,
    required this.danger,
    required this.dangerSoft,
    required this.dangerInk,
    required this.warning,
    required this.warningSoft,
    required this.warningInk,
    required this.success,
    required this.successSoft,
    required this.successInk,
    required this.info,
    required this.infoSoft,
    required this.infoInk,
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textInverse,
    required this.disabled,
    required this.disabledBg,
    required this.gradientHeader,
    required this.gradientHeaderSoft,
    required this.gradientPrimaryGlow,
    required this.radiusCard,
    required this.radiusCardSm,
    required this.radiusButton,
    required this.radiusInput,
    required this.radiusBadge,
    required this.radiusModal,
    required this.radiusAvatar,
    required this.spacing,
    required this.shadows,
    required this.memberColors,
    required this.durFast,
    required this.durBase,
    required this.durSlow,
    required this.durBounce,
    required this.easeSpring,
    required this.easeOut,
    required this.tabBarHeight,
    required this.cardPadding,
    required this.btnHeight,
    required this.switchOnBg,
    required this.avatarSize,
    required this.ringSize,
    required this.ringTrack,
    required this.ringStrokeWidth,
  });

  /// 浅色主题（默认）。
  factory AppTheme.light() => AppTheme(
        primary: AppColors.primary,
        primaryHover: AppColors.primaryHover,
        primaryActive: AppColors.primaryActive,
        primarySoft: AppColors.primarySoft,
        primarySoft2: AppColors.primarySoft2,
        primaryInk: AppColors.primaryInk,
        secondary: AppColors.secondary,
        secondarySoft: AppColors.secondarySoft,
        secondaryInk: AppColors.secondaryInk,
        sky: AppColors.sky,
        skySoft: AppColors.skySoft,
        skyInk: AppColors.skyInk,
        sun: AppColors.sun,
        sunSoft: AppColors.sunSoft,
        sunInk: AppColors.sunInk,
        berry: AppColors.berry,
        berrySoft: AppColors.berrySoft,
        berryInk: AppColors.berryInk,
        danger: AppColors.danger,
        dangerSoft: AppColors.dangerSoft,
        dangerInk: AppColors.dangerInk,
        warning: AppColors.warning,
        warningSoft: AppColors.warningSoft,
        warningInk: AppColors.warningInk,
        success: AppColors.success,
        successSoft: AppColors.successSoft,
        successInk: AppColors.successInk,
        info: AppColors.info,
        infoSoft: AppColors.infoSoft,
        infoInk: AppColors.infoInk,
        bg: AppColors.bg,
        surface: AppColors.surface,
        surface2: AppColors.surface2,
        border: AppColors.border,
        borderStrong: AppColors.borderStrong,
        textPrimary: AppColors.textPrimary,
        textSecondary: AppColors.textSecondary,
        textTertiary: AppColors.textTertiary,
        textInverse: AppColors.textInverse,
        disabled: AppColors.disabled,
        disabledBg: AppColors.disabledBg,
        gradientHeader: AppColors.gradientHeader,
        gradientHeaderSoft: AppColors.gradientHeaderSoft,
        gradientPrimaryGlow: AppColors.gradientPrimaryGlow,
        radiusCard: 20,
        radiusCardSm: 16,
        radiusButton: 999,
        radiusInput: 14,
        radiusBadge: 999,
        radiusModal: 24,
        radiusAvatar: 999,
        spacing: AppSpacing.light(),
        shadows: AppShadows.light(),
        memberColors: const [
          Color(0xFFFF7A59), // member-1 爸爸
          Color(0xFF4DA3FF), // member-2 妈妈
          Color(0xFFF2C94C), // member-3 孩子
          Color(0xFFFF7AA8), // member-4 奶奶
          Color(0xFF36C58A), // member-5 爷爷
          Color(0xFF9B8CFF), // member-6 其他
        ],
        durFast: const Duration(milliseconds: 160),
        durBase: const Duration(milliseconds: 240),
        durSlow: const Duration(milliseconds: 360),
        durBounce: const Duration(milliseconds: 420),
        easeSpring: const Cubic(0.34, 1.56, 0.64, 1),
        easeOut: const Cubic(0.22, 1, 0.36, 1),
        tabBarHeight: 64,
        cardPadding: 16,
        btnHeight: 48,
        switchOnBg: AppColors.primary,
        avatarSize: 36,
        ringSize: 64,
        ringTrack: AppColors.surface2,
        ringStrokeWidth: 8,
      );

  // —— Primary ——
  final Color primary;
  final Color primaryHover;
  final Color primaryActive;
  final Color primarySoft;
  final Color primarySoft2;
  final Color primaryInk;

  // —— Secondary ——
  final Color secondary;
  final Color secondarySoft;
  final Color secondaryInk;

  // —— Accent ——
  final Color sky;
  final Color skySoft;
  final Color skyInk;
  final Color sun;
  final Color sunSoft;
  final Color sunInk;
  final Color berry;
  final Color berrySoft;
  final Color berryInk;

  // —— Semantic ——
  final Color danger;
  final Color dangerSoft;
  final Color dangerInk;
  final Color warning;
  final Color warningSoft;
  final Color warningInk;
  final Color success;
  final Color successSoft;
  final Color successInk;
  final Color info;
  final Color infoSoft;
  final Color infoInk;

  // —— Neutral ——
  final Color bg;
  final Color surface;
  final Color surface2;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textInverse;
  final Color disabled;
  final Color disabledBg;

  // —— Gradient ——
  final Gradient gradientHeader;
  final Gradient gradientHeaderSoft;
  final Gradient gradientPrimaryGlow;

  // —— Radius ——
  final double radiusCard;
  final double radiusCardSm;
  final double radiusButton;
  final double radiusInput;
  final double radiusBadge;
  final double radiusModal;
  final double radiusAvatar;

  // —— Composite ——
  final AppSpacing spacing;
  final AppShadows shadows;
  final List<Color> memberColors;

  // —— Motion ——
  final Duration durFast;
  final Duration durBase;
  final Duration durSlow;
  final Duration durBounce;
  final Cubic easeSpring;
  final Cubic easeOut;

  // —— Component sizing ——
  final double tabBarHeight;
  final double cardPadding;
  final double btnHeight;
  final Color switchOnBg;
  final double avatarSize;
  final double ringSize;
  final Color ringTrack;
  final double ringStrokeWidth;

  /// 便捷取用：从 context 读取（非空）。
  static AppTheme of(BuildContext context) =>
      Theme.of(context).extension<AppTheme>()!;

  /// 语义徽标配色：danger / warning / success / info / berry / sky / sun / primary。
  BadgeColors badge(BadgeKind kind) {
    switch (kind) {
      case BadgeKind.danger:
        return BadgeColors(bg: dangerSoft, fg: dangerInk);
      case BadgeKind.warning:
        return BadgeColors(bg: warningSoft, fg: warningInk);
      case BadgeKind.success:
        return BadgeColors(bg: successSoft, fg: successInk);
      case BadgeKind.info:
        return BadgeColors(bg: infoSoft, fg: infoInk);
      case BadgeKind.berry:
        return BadgeColors(bg: berrySoft, fg: berryInk);
      case BadgeKind.sky:
        return BadgeColors(bg: skySoft, fg: skyInk);
      case BadgeKind.sun:
        return BadgeColors(bg: sunSoft, fg: sunInk);
      case BadgeKind.primary:
        return BadgeColors(bg: primarySoft, fg: primaryInk);
    }
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryActive,
    Color? primarySoft,
    Color? primarySoft2,
    Color? primaryInk,
    Color? secondary,
    Color? secondarySoft,
    Color? secondaryInk,
    Color? sky,
    Color? skySoft,
    Color? skyInk,
    Color? sun,
    Color? sunSoft,
    Color? sunInk,
    Color? berry,
    Color? berrySoft,
    Color? berryInk,
    Color? danger,
    Color? dangerSoft,
    Color? dangerInk,
    Color? warning,
    Color? warningSoft,
    Color? warningInk,
    Color? success,
    Color? successSoft,
    Color? successInk,
    Color? info,
    Color? infoSoft,
    Color? infoInk,
    Color? bg,
    Color? surface,
    Color? surface2,
    Color? border,
    Color? borderStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInverse,
    Color? disabled,
    Color? disabledBg,
    Gradient? gradientHeader,
    Gradient? gradientHeaderSoft,
    Gradient? gradientPrimaryGlow,
    double? radiusCard,
    double? radiusCardSm,
    double? radiusButton,
    double? radiusInput,
    double? radiusBadge,
    double? radiusModal,
    double? radiusAvatar,
    AppSpacing? spacing,
    AppShadows? shadows,
    List<Color>? memberColors,
    Duration? durFast,
    Duration? durBase,
    Duration? durSlow,
    Duration? durBounce,
    Cubic? easeSpring,
    Cubic? easeOut,
    double? tabBarHeight,
    double? cardPadding,
    double? btnHeight,
    Color? switchOnBg,
    double? avatarSize,
    double? ringSize,
    Color? ringTrack,
    double? ringStrokeWidth,
  }) {
    return AppTheme(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryActive: primaryActive ?? this.primaryActive,
      primarySoft: primarySoft ?? this.primarySoft,
      primarySoft2: primarySoft2 ?? this.primarySoft2,
      primaryInk: primaryInk ?? this.primaryInk,
      secondary: secondary ?? this.secondary,
      secondarySoft: secondarySoft ?? this.secondarySoft,
      secondaryInk: secondaryInk ?? this.secondaryInk,
      sky: sky ?? this.sky,
      skySoft: skySoft ?? this.skySoft,
      skyInk: skyInk ?? this.skyInk,
      sun: sun ?? this.sun,
      sunSoft: sunSoft ?? this.sunSoft,
      sunInk: sunInk ?? this.sunInk,
      berry: berry ?? this.berry,
      berrySoft: berrySoft ?? this.berrySoft,
      berryInk: berryInk ?? this.berryInk,
      danger: danger ?? this.danger,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      dangerInk: dangerInk ?? this.dangerInk,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
      warningInk: warningInk ?? this.warningInk,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      successInk: successInk ?? this.successInk,
      info: info ?? this.info,
      infoSoft: infoSoft ?? this.infoSoft,
      infoInk: infoInk ?? this.infoInk,
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverse: textInverse ?? this.textInverse,
      disabled: disabled ?? this.disabled,
      disabledBg: disabledBg ?? this.disabledBg,
      gradientHeader: gradientHeader ?? this.gradientHeader,
      gradientHeaderSoft: gradientHeaderSoft ?? this.gradientHeaderSoft,
      gradientPrimaryGlow: gradientPrimaryGlow ?? this.gradientPrimaryGlow,
      radiusCard: radiusCard ?? this.radiusCard,
      radiusCardSm: radiusCardSm ?? this.radiusCardSm,
      radiusButton: radiusButton ?? this.radiusButton,
      radiusInput: radiusInput ?? this.radiusInput,
      radiusBadge: radiusBadge ?? this.radiusBadge,
      radiusModal: radiusModal ?? this.radiusModal,
      radiusAvatar: radiusAvatar ?? this.radiusAvatar,
      spacing: spacing ?? this.spacing,
      shadows: shadows ?? this.shadows,
      memberColors: memberColors ?? this.memberColors,
      durFast: durFast ?? this.durFast,
      durBase: durBase ?? this.durBase,
      durSlow: durSlow ?? this.durSlow,
      durBounce: durBounce ?? this.durBounce,
      easeSpring: easeSpring ?? this.easeSpring,
      easeOut: easeOut ?? this.easeOut,
      tabBarHeight: tabBarHeight ?? this.tabBarHeight,
      cardPadding: cardPadding ?? this.cardPadding,
      btnHeight: btnHeight ?? this.btnHeight,
      switchOnBg: switchOnBg ?? this.switchOnBg,
      avatarSize: avatarSize ?? this.avatarSize,
      ringSize: ringSize ?? this.ringSize,
      ringTrack: ringTrack ?? this.ringTrack,
      ringStrokeWidth: ringStrokeWidth ?? this.ringStrokeWidth,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this;
    return this;
  }
}

/// 语义徽标配色对（浅底深字）。
class BadgeColors {
  const BadgeColors({required this.bg, required this.fg});
  final Color bg;
  final Color fg;
}

/// 语义徽标种类（与 DESIGN.md 一致）。
enum BadgeKind {
  danger,
  warning,
  success,
  info,
  berry,
  sky,
  sun,
  primary,
}
