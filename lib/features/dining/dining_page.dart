/// 餐桌页（system_design §T07 · 根视图）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../features/shared/app_chip.dart';
import '../../features/shared/screen_header.dart';
import 'sub_views/recipe_library_view.dart';
import 'sub_views/today_menu_view.dart';

/// 餐桌 Tab 根页面（菜谱库 / 今日菜单 切换）。
class DiningPage extends ConsumerStatefulWidget {
  /// 构造。
  const DiningPage({super.key});

  @override
  ConsumerState<DiningPage> createState() => _DiningPageState();
}

class _DiningPageState extends ConsumerState<DiningPage> {
  String _tab = '菜谱库';

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            const ScreenHeader(title: '🍽️ 餐桌'),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: AppChipGroup(
                options: const ['菜谱库', '今日菜单'],
                selected: _tab,
                onSelected: (v) => setState(() => _tab = v),
              ),
            ),
            Expanded(
              child: _tab == '菜谱库'
                  ? const RecipeLibraryView()
                  : const TodayMenuView(),
            ),
          ],
        ),
      ),
    );
  }
}
