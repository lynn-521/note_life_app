/// 成员切换（头像胶囊）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/member.dart';
import '../../../providers/app_providers.dart';
import '../../shared/avatar_dot.dart';

/// 横向成员切换条（点选切换当前家庭成员）。
class MemberSwitch extends ConsumerWidget {
  /// 构造。
  const MemberSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final members = ref.watch(membersProvider);
    final selectedId = ref.watch(currentMemberIdProvider);
    return members.when(
      data: (list) => list.isEmpty
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: list.map((m) {
                  final active = selectedId == m.id ||
                      (selectedId == null && list.first.id == m.id);
                  final initial =
                      m.name.isNotEmpty ? m.name[0] : '?';
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () => ref
                          .read(currentMemberIdProvider.notifier)
                          .state = m.id,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: active ? theme.primary : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: AvatarDot(
                                color: Color(m.color), label: initial),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            m.name,
                            style: AppTextStyles.sans(12, weight: FontWeight.w700)
                                .copyWith(
                              color: active
                                  ? theme.primaryInk
                                  : theme.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
      loading: () => const SizedBox(height: 64),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
