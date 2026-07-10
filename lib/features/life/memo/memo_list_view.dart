/// 备忘录列表（置顶 / 完成 / 到期徽标）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../features/shared/empty_state.dart';
import '../providers/life_providers.dart';
import 'memo_form_sheet.dart';
import 'memo_list_item.dart';

/// 备忘录列表视图。
class MemoListView extends ConsumerWidget {
  /// 构造。
  const MemoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memos = ref.watch(memosProvider);
    return memos.when(
      data: (list) => list.isEmpty
          ? const EmptyState(
              title: '还没有备忘',
              subtitle: '点右上角 ➕ 记一笔吧～',
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => MemoListItem(memo: list[i]),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('加载失败: $e')),
    );
  }
}
