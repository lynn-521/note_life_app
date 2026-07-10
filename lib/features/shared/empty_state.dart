/// 空状态组件（DESIGN.md §4 Empty State）。插画 + 鼓励文案，柔和治愈。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 空状态：插画 + 标题 + 副文案 + 可选底部内容（如路线图）。
class EmptyState extends StatelessWidget {
  /// 构造。
  const EmptyState({
    super.key,
    this.illustration,
    required this.title,
    required this.subtitle,
    this.child,
  });

  /// 插画（默认柔色圆形占位）。
  final Widget? illustration;

  /// 标题。
  final String title;

  /// 副文案（可为多行）。
  final String subtitle;

  /// 可选底部内容（如路线图 chips）。
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        illustration ??
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: theme.surface2,
                shape: BoxShape.circle,
              ),
            ),
        const SizedBox(height: 24),
        Text(title, style: AppTextStyles.display(24, weight: FontWeight.w700)),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.sans(14, color: theme.textSecondary)
                .copyWith(height: 1.6),
          ),
        ),
        if (child != null) ...[const SizedBox(height: 24), child!],
      ],
    );
  }
}
