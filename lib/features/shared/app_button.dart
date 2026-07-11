/// 按钮组件（DESIGN.md §4 Button）。胶囊形；主按钮亮珊瑚底 + 深字；按下回弹(spring)。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 按钮种类。
enum AppButtonKind { primary, secondary, ghost }

/// 应用按钮：支持主/次/幽灵三态，按下回弹。
class AppButton extends StatefulWidget {
  /// 构造。
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.kind = AppButtonKind.primary,
    this.block = false,
    this.large = false,
    this.small = false,
    this.icon,
  });

  /// 文案。
  final String label;

  /// 点击回调（null 为禁用）。
  final VoidCallback? onPressed;

  /// 按钮种类。
  final AppButtonKind kind;

  /// 是否占满整行。
  final bool block;

  /// 大号（54px）。
  final bool large;

  /// 小号（36px）。
  final bool small;

  /// 前置图标。
  final Widget? icon;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final enabled = widget.onPressed != null;
    final height = widget.large
        ? 54.0
        : widget.small
            ? 36.0
            : theme.btnHeight;

    Color bg;
    Color fg;
    BorderSide border = BorderSide.none;
    BoxShadow? shadow;
    switch (widget.kind) {
      case AppButtonKind.primary:
        bg = theme.primary;
        fg = theme.textPrimary; // 深字
        shadow = theme.shadows.primary;
      case AppButtonKind.secondary:
        bg = theme.surface;
        fg = theme.primaryInk;
        border = BorderSide(color: theme.primary, width: 1.5);
      case AppButtonKind.ghost:
        bg = Colors.transparent;
        fg = theme.primaryInk;
    }

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[widget.icon!, const SizedBox(width: 8)],
        Text(widget.label, style: AppTextStyles.sans(16, weight: FontWeight.w700)),
      ],
    );

    final box = Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: enabled ? bg : theme.disabledBg,
        borderRadius: BorderRadius.circular(999),
        border: Border.fromBorderSide(border),
        boxShadow: enabled && shadow != null ? [shadow] : null,
      ),
      child: Center(
        child: IconTheme(
          data: IconThemeData(color: enabled ? fg : theme.disabled),
          child: DefaultTextStyle(
            style: AppTextStyles.sans(16, weight: FontWeight.w700)
                .copyWith(color: enabled ? fg : theme.disabled),
            child: child,
          ),
        ),
      ),
    );

    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
      onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _pressed && enabled ? 0.96 : 1.0,
        duration: theme.durFast,
        curve: theme.easeSpring,
        child: widget.block ? SizedBox(width: double.infinity, child: box) : box,
      ),
    );
  }
}
