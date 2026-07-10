/// 卡片组件（DESIGN.md §4 Card）。大圆角 + 柔和投影，可选入场弹入动效。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';

/// 卡片容器：表面色 + 20px 圆角 + 柔和投影。可选点击与入场动效。
class AppCard extends StatefulWidget {
  /// 构造。
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.animate = false,
    this.index = 0,
  });

  /// 卡片内容。
  final Widget child;

  /// 内边距（默认取主题 cardPadding）。
  final EdgeInsetsGeometry? padding;

  /// 点击回调（非空则整体可点）。
  final VoidCallback? onTap;

  /// 是否启用入场弹入（spring）。
  final bool animate;

  /// 入场动效错峰序号。
  final int index;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _entered = false;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      Future.delayed(Duration(milliseconds: widget.index * 70), () {
        if (mounted) setState(() => _entered = true);
      });
    } else {
      _entered = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final reduce = MediaQuery.of(context).disabledAnimations;

    final box = Container(
      padding: widget.padding ?? EdgeInsets.all(theme.cardPadding),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(theme.radiusCard),
        boxShadow: [theme.shadows.sm],
      ),
      child: widget.child,
    );

    final tappable = widget.onTap != null
        ? Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(theme.radiusCard),
            child: InkWell(
              borderRadius: BorderRadius.circular(theme.radiusCard),
              onTap: widget.onTap,
              child: box,
            ),
          )
        : box;

    if (!widget.animate || reduce) return tappable;

    return AnimatedSlide(
      offset: _entered ? Offset.zero : const Offset(0, 0.06),
      duration: theme.durSlow,
      curve: theme.easeOut,
      child: AnimatedOpacity(
        opacity: _entered ? 1 : 0,
        duration: theme.durSlow,
        curve: theme.easeOut,
        child: tappable,
      ),
    );
  }
}
