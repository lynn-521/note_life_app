/// 仓库页（system_design §T05 · 根视图）。
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/design_tokens.dart';
import '../shared/screen_header.dart';
import 'sub_views/warehouse_overview_view.dart';

/// 仓库 Tab 根页面。
class StoragePage extends StatelessWidget {
  /// 构造。
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: '📦 仓库',
              actionIcon: '➕',
              onAction: () => context.push('/storage/inbound'),
            ),
            const Expanded(child: WarehouseOverviewView()),
          ],
        ),
      ),
    );
  }
}
