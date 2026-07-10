/// 底部 5 Tab（DESIGN.md §4 Tab Bar）。选中态：图标主色 + 深珊瑚字 + 浅珊瑚 pill 底。
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 单个 Tab 描述（emoji 图标 + 文案）。
class AppTabItem {
  /// 构造。
  const AppTabItem({required this.icon, required this.label});

  /// emoji 图标。
  final String icon;

  /// 文案。
  final String label;
}

/// 底部 Tab 栏：毛玻璃 + 顶部描边；选中项圆角浅底。
class AppTabBar extends StatelessWidget {
  /// 构造。
  const AppTabBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  /// Tab 列表（5 个）。
  final List<AppTabItem> items;

  /// 当前选中索引。
  final int currentIndex;

  /// 切换回调。
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final safeBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      height: theme.tabBarHeight + safeBottom,
      padding: EdgeInsets.only(bottom: safeBottom),
      decoration: BoxDecoration(
        color: theme.surface.withOpacity(0.92),
        border: Border(top: BorderSide(color: theme.border)),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Row(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final active = index == currentIndex;
              return Expanded(
                child: _TabButton(
                  item: item,
                  active: active,
                  onTap: () => onTap(index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.item,
    required this.active,
    required this.onTap,
  });

  final AppTabItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: active ? 1.0 : 1.0,
        duration: theme.durFast,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: active ? theme.primarySoft : Colors.transparent,
                borderRadius: BorderRadius.circular(theme.radiusCardSm),
              ),
              child: Text(
                item.icon,
                style: TextStyle(
                  fontSize: 22,
                  color: active ? theme.primary : theme.textTertiary,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              item.label,
              style: AppTextStyles.sans(11, weight: FontWeight.w700).copyWith(
                color: active ? theme.primaryInk : theme.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
