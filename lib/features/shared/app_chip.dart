/// 芯片组件（DESIGN.md §4 Chips）。可单选分组，选中态浅珊瑚底深字。
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 单选芯片。用于分类 / 单位选择。
class AppChip extends StatelessWidget {
  /// 构造。
  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  /// 文案。
  final String label;

  /// 是否选中。
  final bool selected;

  /// 点击回调（null 为只读）。
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? theme.primarySoft : theme.surface2,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? theme.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.sans(14, weight: FontWeight.w700).copyWith(
            color: selected ? theme.primaryInk : theme.textSecondary,
          ),
        ),
      ),
    );
  }
}

/// 单选芯片组（互斥）。
class AppChipGroup extends StatelessWidget {
  /// 构造。
  const AppChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  /// 选项文案列表。
  final List<String> options;

  /// 当前选中项。
  final String selected;

  /// 选中变更回调。
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options
          .map(
            (o) => AppChip(
              label: o,
              selected: o == selected,
              onTap: () => onSelected(o),
            ),
          )
          .toList(),
    );
  }
}
