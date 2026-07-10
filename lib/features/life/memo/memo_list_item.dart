/// 备忘录列表项（完成 / 置顶 / 到期徽标 / 编辑）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../data/models/memo.dart';
import '../../../features/shared/app_badge.dart';
import '../../../features/shared/app_card.dart';
import '../providers/life_providers.dart';
import 'memo_form_sheet.dart';

/// 备忘录项。
class MemoListItem extends ConsumerWidget {
  /// 构造。
  const MemoListItem({super.key, required this.memo});

  /// 备忘录。
  final Memo memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final done = memo.done;
    final dueBadge = _dueBadge(memo.dueAt);

    return AppCard(
      onTap: () => _openEdit(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => ref.read(memoNotifier.notifier).toggleDone(memo),
            child: Container(
              width: 26,
              height: 26,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: done ? theme.success : theme.surface2,
                shape: BoxShape.circle,
                border: done
                    ? null
                    : Border.all(color: theme.borderStrong, width: 1.5),
              ),
              child: done
                  ? Icon(Icons.check, size: 16, color: theme.textInverse)
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (memo.pinned)
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Text('⭐', style: TextStyle(fontSize: 12)),
                      ),
                    Expanded(
                      child: Text(
                        memo.title,
                        style: AppTextStyles.sans(16, weight: FontWeight.w800)
                            .copyWith(
                          color: done
                              ? theme.textTertiary
                              : theme.textPrimary,
                          decoration: done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                if (memo.body.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    memo.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.sans(13)
                        .copyWith(color: theme.textSecondary),
                  ),
                ],
                if (dueBadge != null) ...[
                  const SizedBox(height: 8),
                  dueBadge!,
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => ref.read(memoNotifier.notifier).togglePin(memo),
            child: Text(
              memo.pinned ? '⭐' : '☆',
              style: TextStyle(
                fontSize: 18,
                color: memo.pinned ? theme.sun : theme.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _dueBadge(DateTime? due) {
    if (due == null) return null;
    final days = DateTimeX.today.daysUntil(due);
    if (days < 0) {
      return const AppBadge(kind: BadgeKind.danger, text: '已逾期');
    }
    if (days == 0) {
      return const AppBadge(kind: BadgeKind.danger, text: '今天到期');
    }
    return AppBadge(kind: BadgeKind.warning, text: '$days 天后到期');
  }

  void _openEdit(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MemoFormSheet(memo: memo),
    );
  }
}
