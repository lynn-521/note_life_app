/// 底部导航外壳（AppTabBar + 内容分支）。
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_tab_bar.dart';

/// 5 Tab 容器：渲染当前选中的分支页面 + 底部 Tab 栏。
class AppScaffold extends StatelessWidget {
  /// 构造。
  const AppScaffold({super.key, required this.shell});

  /// 状态化外壳（含各分支 Navigator）。
  final StatefulShell shell;

  static const List<AppTabItem> _items = [
    AppTabItem(icon: '📦', label: '仓库'),
    AppTabItem(icon: '💊', label: '健康'),
    AppTabItem(icon: '🍽️', label: '餐桌'),
    AppTabItem(icon: '📝', label: '生活'),
    AppTabItem(icon: '👤', label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: AppTabBar(
        items: _items,
        currentIndex: shell.currentIndex,
        onTap: (index) => shell.goBranch(index),
      ),
    );
  }
}
