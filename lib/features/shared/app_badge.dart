/// 徽标组件（DESIGN.md §4 Badge）。圆角浅底深字，杜绝大红大黄块。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 语义徽标：浅底深字，可选跳动动效（临期提示）。
class AppBadge extends StatelessWidget {
  /// 构造。
  const AppBadge({
    super.key,
    required this.kind,
    required this.text,
    this.bounce = false,
    this.icon,
  });

  /// 语义种类。
  final BadgeKind kind;

  /// 文案。
  final String text;

  /// 是否跳动（临期提示，尊重 reduce-motion）。
  final bool bounce;

  /// 可选前置图标（emoji/IconData 渲染为文本）。
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = theme.badge(kind);
    final reduce = MediaQuery.of(context).disabledAnimations;

    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors.bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Text(icon!, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.sans(12, weight: FontWeight.w700)
                .copyWith(color: colors.fg),
          ),
        ],
      ),
    );

    if (!bounce || reduce) return badge;
    return _Bounce(child: badge);
  }
}

/// 跳动封装（弹簧），尊重 reduce-motion。
class _Bounce extends StatefulWidget {
  const _Bounce({required this.child});
  final Widget child;

  @override
  State<_Bounce> createState() => _BounceState();
}

class _BounceState extends State<_Bounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    final theme = AppTheme.of(context);
    _controller = AnimationController(
      vsync: this,
      duration: theme.durBounce,
    )..repeat(reverse: true);
    _offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.25),
    ).animate(CurvedAnimation(parent: _controller, curve: theme.easeSpring));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      SlideTransition(position: _offset, child: widget.child);
}
