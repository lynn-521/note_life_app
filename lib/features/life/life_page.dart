/// 生活页（system_design §T08 / §T09 · 根视图）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../features/shared/app_chip.dart';
import '../../features/shared/screen_header.dart';
import 'memo/memo_form_sheet.dart';
import 'memo/memo_list_view.dart';
import 'travel/travel_form_sheet.dart';
import 'travel/travel_list_view.dart';

/// 生活 Tab 根页面（备忘录 / 旅游计划切换）。
class LifePage extends ConsumerStatefulWidget {
  /// 构造。
  const LifePage({super.key});

  @override
  ConsumerState<LifePage> createState() => _LifePageState();
}

class _LifePageState extends ConsumerState<LifePage> {
  String _tab = '备忘录';

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: '📝 生活',
              actionIcon: '➕',
              onAction: () => _openAdd(context),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: AppChipGroup(
                options: const ['备忘录', '旅游计划'],
                selected: _tab,
                onSelected: (v) => setState(() => _tab = v),
              ),
            ),
            Expanded(
              child: _tab == '备忘录'
                  ? const MemoListView()
                  : const TravelListView(),
            ),
          ],
        ),
      ),
    );
  }

  void _openAdd(BuildContext context) {
    if (_tab == '备忘录') {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const MemoFormSheet(),
      );
    } else {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const TravelFormSheet(),
      );
    }
  }
}
