/// 开关组件（DESIGN.md §4 Switch）。开启=主色，圆头滑块。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';

/// 主题化开关：开启态走主色，尊重系统色彩。
class AppSwitch extends StatelessWidget {
  /// 构造。
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  /// 当前开启状态。
  final bool value;

  /// 状态变更回调。
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Switch(
      value: value,
      onChanged: onChanged,
      activeThumbColor: theme.switchOnBg,
      activeTrackColor: theme.switchOnBg.withValues(alpha: 0.4),
      inactiveThumbColor: theme.surface,
      inactiveTrackColor: theme.borderStrong,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      thumbIcon: WidgetStateProperty.all(null),
    );
  }
}
