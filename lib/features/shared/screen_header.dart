/// 屏头部（带可选操作按钮）。复用 DESIGN.md §3 头部风格。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 屏头部：标题 + 右侧圆形操作按钮（如新增 / 入库）。
class ScreenHeader extends StatelessWidget {
  /// 构造。
  const ScreenHeader({
    super.key,
    required this.title,
    this.actionIcon,
    this.onAction,
  });

  /// 标题（支持 emoji 前缀）。
  final String title;

  /// 右侧操作按钮 emoji（null 则不显示）。
  final String? actionIcon;

  /// 操作回调。
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.bg.withOpacity(0.88),
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.display(24, weight: FontWeight.w700),
              ),
            ),
            if (actionIcon != null && onAction != null)
              GestureDetector(
                onTap: onAction,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: theme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [theme.shadows.xs],
                  ),
                  child: Center(
                    child: Text(actionIcon!, style: const TextStyle(fontSize: 18)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
