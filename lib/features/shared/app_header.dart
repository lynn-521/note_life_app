/// 屏内浮层标题（DESIGN.md §3 App Header）。粘性半透明 + 返回/操作按钮。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 屏头部：标题 + 右侧操作按钮（如通知/新增）。用于健康/餐桌/生活等 Tab。
class AppHeader extends StatelessWidget {
  /// 构造。
  const AppHeader({
    super.key,
    required this.title,
    this.trailing,
    this.onBack,
  });

  /// 标题（支持 emoji 前缀）。
  final String title;

  /// 右侧操作按钮（emoji 字符串）。
  final String? trailing;

  /// 返回按钮回调（非空显示返回箭头）。
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.bg.withValues(alpha: 0.88),
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (onBack != null)
              _HeaderButton(icon: '‹', onTap: onBack!),
            Expanded(
              child: Text(title, style: AppTextStyles.display(24, weight: FontWeight.w700)),
            ),
            if (trailing != null)
              _HeaderButton(icon: trailing!, onTap: null),
          ],
        ),
      ),
    );
  }
}

/// 头部圆形按钮（返回 / 操作）。trailing 仅展示不响应点击。
class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final btn = Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: theme.surface,
        shape: BoxShape.circle,
        boxShadow: [theme.shadows.xs],
      ),
      child: Center(
        child: Text(icon, style: const TextStyle(fontSize: 18)),
      ),
    );
    if (onTap == null) return btn;
    return GestureDetector(
      onTap: onTap,
      child: btn,
    );
  }
}
