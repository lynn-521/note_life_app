/// 旅游清单项行（勾选 / 认领 / 删除）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_item.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/avatar_dot.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';

/// 清单项行。
class TravelItemRow extends ConsumerWidget {
  /// 构造。
  const TravelItemRow({
    super.key,
    required this.item,
    required this.membersById,
    required this.onChanged,
  });

  /// 清单项。
  final TravelItem item;

  /// 成员映射。
  final Map<String, Member> membersById;

  /// 变更后刷新。
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final isBudget = item.type == TravelItemType.budget;
    final assignee =
        item.assignedTo != null ? membersById[item.assignedTo] : null;
    final valueText = isBudget
        ? '¥${(item.amount ?? 0).toStringAsFixed(0)}'
        : '${item.qty ?? 0}';

    return AppCard(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(travelNotifier.notifier).toggleItemDone(item);
              onChanged();
            },
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: item.done ? theme.success : theme.surface2,
                shape: BoxShape.circle,
                border: item.done
                    ? null
                    : Border.all(color: theme.borderStrong, width: 1.5),
              ),
              child: item.done
                  ? Icon(Icons.check, size: 16, color: theme.textInverse)
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: AppTextStyles.sans(15, weight: FontWeight.w700)
                        .copyWith(
                      color: item.done
                          ? theme.textTertiary
                          : theme.textPrimary,
                      decoration: item.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    )),
                const SizedBox(height: 2),
                Text(valueText,
                    style: AppTextStyles.sans(12, weight: FontWeight.w700)
                        .copyWith(
                      color: isBudget ? theme.sunInk : theme.textSecondary,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _pickAssignee(context, ref),
            child: assignee == null
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.surface2,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('认领',
                        style: AppTextStyles.sans(12, weight: FontWeight.w700)
                            .copyWith(color: theme.textTertiary)),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AvatarDot(
                        color: Color(assignee.color),
                        label: assignee.name.isNotEmpty
                            ? assignee.name[0]
                            : '?',
                        size: 24,
                      ),
                      const SizedBox(width: 4),
                      Text(assignee.name,
                          style: AppTextStyles.sans(12, weight: FontWeight.w700)
                              .copyWith(color: theme.textSecondary)),
                    ],
                  ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              await ref.read(travelNotifier.notifier).deleteItem(item.id);
              onChanged();
            },
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: theme.surface2,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text('🗑', style: TextStyle(fontSize: 14)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAssignee(BuildContext context, WidgetRef ref) async {
    final theme = AppTheme.of(context);
    final members =
        ref.read(membersProvider).valueOrNull ?? const <Member>[];
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: theme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.radiusModal),
        ),
        title: Text('认领人',
            style: AppTextStyles.sans(16, weight: FontWeight.w800)
                .copyWith(color: theme.textPrimary)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _pickerRow(ref, null, '清除认领', membersById),
              ...members.map(
                (m) => _pickerRow(ref, m.id, m.name, membersById),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pickerRow(WidgetRef ref, String? id, String name,
      Map<String, Member> membersById) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: () {
        ref.read(travelNotifier.notifier).claimItem(item, id);
        onChanged();
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            if (id != null)
              AvatarDot(
                color: Color(membersById[id]?.color ?? theme.memberColors.last.value),
                label: name.isNotEmpty ? name[0] : '?',
                size: 26,
              )
            else
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: theme.surface2,
                  shape: BoxShape.circle,
                ),
              ),
            const SizedBox(width: 10),
            Text(name,
                style: AppTextStyles.sans(14, weight: FontWeight.w700)
                    .copyWith(color: theme.textPrimary)),
          ],
        ),
      ),
    );
  }
}
