/// 成员彩色圆点头像（DESIGN.md §4 Avatar Dot）。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 圆点头像：彩色底 + 反白首字。
class AvatarDot extends StatelessWidget {
  /// 构造。
  const AvatarDot({
    super.key,
    required this.color,
    required this.label,
    this.size,
  });

  /// 头像底色（来自 Member.color / 成员调色板）。
  final Color color;

  /// 展示字符（通常为成员昵称首字）。
  final String label;

  /// 直径（默认取主题 avatarSize）。
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final d = size ?? theme.avatarSize;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [theme.shadows.xs],
      ),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.num(d * 0.42, weight: FontWeight.w800)
              .copyWith(color: theme.textInverse),
        ),
      ),
    );
  }
}
