/// 步进器组件（DESIGN.md §4 Stepper）。数量加减，圆点按钮。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 数量步进器：− / 数字 / ＋。
class AppStepper extends StatelessWidget {
  /// 构造。
  const AppStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 999,
  });

  /// 当前值。
  final int value;

  /// 变更回调。
  final ValueChanged<int> onChanged;

  /// 最小值。
  final int min;

  /// 最大值。
  final int max;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _RoundBtn(
          label: '−',
          onTap: value > min ? () => onChanged(value - 1) : null,
        ),
        SizedBox(
          width: 36,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: AppTextStyles.num(20, weight: FontWeight.w800)
                .copyWith(color: theme.textPrimary),
          ),
        ),
        _RoundBtn(
          label: '＋',
          onTap: value < max ? () => onChanged(value + 1) : null,
        ),
      ],
    );
  }
}

class _RoundBtn extends StatelessWidget {
  const _RoundBtn({required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: enabled ? 1 : 0.9,
        duration: theme.durFast,
        curve: theme.easeSpring,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: enabled ? theme.surface2 : theme.disabledBg,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.num(20, weight: FontWeight.w800).copyWith(
                color: enabled ? theme.primaryInk : theme.disabled,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
