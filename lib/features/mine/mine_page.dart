/// 我的页（system_design §T?? · 根视图）。
///
/// 家庭成员 / 提醒设置 / 微信绑定（占位）/ 同步状态（占位）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';
import '../../data/models/enums.dart';
import '../../data/models/member.dart';
import '../../features/shared/app_badge.dart';
import '../../features/shared/app_card.dart';
import '../../features/shared/app_switch.dart';
import '../../features/shared/avatar_dot.dart';
import '../../features/shared/screen_header.dart';
import '../../providers/app_providers.dart';

/// 我的 Tab 根页面。
class MinePage extends ConsumerWidget {
  /// 构造。
  const MinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final members = ref.watch(membersProvider);
    final settings = ref.watch(reminderSettingsProvider);
    final lastSync = ref.watch(lastSyncAtProvider);

    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          children: [
            const ScreenHeader(title: '👤 我的'),
            members.when(
              data: (list) => _MemberCard(members: list),
              loading: () => const SizedBox(height: 80),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            settings.when(
              data: (s) => _ReminderCard(settings: s),
              loading: () => const SizedBox(height: 120),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            const _WechatBindCard(),
            const SizedBox(height: 16),
            lastSync.when(
              data: (dt) => _SyncStatusCard(lastSyncAt: dt),
              loading: () => const SizedBox(height: 90),
              error: (_, __) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            const _ServerSettingsCard(),
          ],
        ),
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard({required this.members});
  final List<Member> members;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('家庭成员',
              style: AppTextStyles.sans(16, weight: FontWeight.w800)
                  .copyWith(color: theme.textPrimary)),
          const SizedBox(height: 12),
          if (members.isEmpty)
            Text('还没有成员',
                style: AppTextStyles.sans(14)
                    .copyWith(color: theme.textSecondary))
          else
            ...members.map(
              (m) {
                final initial = m.name.isNotEmpty ? m.name[0] : '?';
                final role = m.role == MemberRole.admin ? '管理员' : '成员';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      AvatarDot(color: Color(m.color), label: initial),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name,
                                style: AppTextStyles.sans(15,
                                        weight: FontWeight.w700)
                                    .copyWith(color: theme.textPrimary)),
                            Text(role,
                                style: AppTextStyles.sans(12)
                                    .copyWith(color: theme.textSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _ReminderCard extends ConsumerWidget {
  const _ReminderCard({required this.settings});
  final ReminderSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('提醒设置',
              style: AppTextStyles.sans(16, weight: FontWeight.w800)
                  .copyWith(color: theme.textPrimary)),
          const SizedBox(height: 8),
          _Row(
            label: '临期提醒',
            value: settings.expiry,
            onChanged: (v) => ref
                .read(reminderSettingsNotifier.notifier)
                .set(AppConstants.prefExpiryReminder, v),
          ),
          _Row(
            label: '低库存提醒',
            value: settings.lowStock,
            onChanged: (v) => ref
                .read(reminderSettingsNotifier.notifier)
                .set(AppConstants.prefLowStockReminder, v),
          ),
          _Row(
            label: '用药提醒',
            value: settings.medication,
            onChanged: (v) => ref
                .read(reminderSettingsNotifier.notifier)
                .set(AppConstants.prefMedicationReminder, v),
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(label,
              style: AppTextStyles.sans(15, weight: FontWeight.w700)
                  .copyWith(color: theme.textPrimary)),
          const Spacer(),
          AppSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _WechatBindCard extends StatelessWidget {
  const _WechatBindCard();
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.successSoft,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('💬', style: TextStyle(fontSize: 22))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('微信绑定',
                    style: AppTextStyles.sans(15, weight: FontWeight.w700)
                        .copyWith(color: theme.textPrimary)),
                Text('接收家庭提醒推送',
                    style: AppTextStyles.sans(12)
                        .copyWith(color: theme.textSecondary)),
              ],
            ),
          ),
          const AppBadge(kind: BadgeKind.info, text: '待绑定'),
        ],
      ),
    );
  }
}

class _SyncStatusCard extends StatelessWidget {
  const _SyncStatusCard({this.lastSyncAt});
  final DateTime? lastSyncAt;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final subtitle = lastSyncAt == null
        ? '尚未连接服务器，数据仅存于本机'
        : '上次同步：${lastSyncAt!.zhLong}';
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.surface2,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('🔄', style: TextStyle(fontSize: 22))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('同步状态',
                    style: AppTextStyles.sans(15, weight: FontWeight.w700)
                        .copyWith(color: theme.textPrimary)),
                Text(subtitle,
                    style: AppTextStyles.sans(12)
                        .copyWith(color: theme.textSecondary)),
              ],
            ),
          ),
          const AppBadge(kind: BadgeKind.success, text: '本地优先'),
        ],
      ),
    );
  }
}

class _ServerSettingsCard extends ConsumerWidget {
  const _ServerSettingsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final configAsync = ref.watch(familyServerConfigProvider);

    final configured = configAsync.maybeWhen(
      data: (c) => c.isConfigured,
      orElse: () => false,
    );
    final badge = configured
        ? const AppBadge(kind: BadgeKind.success, text: '已配置')
        : const AppBadge(kind: BadgeKind.info, text: '未配置');

    return GestureDetector(
      onTap: () => context.push('/mine/server'),
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.surface2,
                shape: BoxShape.circle,
              ),
              child:
                  const Center(child: Text('🖥️', style: TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('服务器设置',
                      style: AppTextStyles.sans(15, weight: FontWeight.w700)
                          .copyWith(color: theme.textPrimary)),
                  Text('内网 / 外网地址与同步凭据',
                      style: AppTextStyles.sans(12)
                          .copyWith(color: theme.textSecondary)),
                ],
              ),
            ),
            badge,
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: theme.textSecondary),
          ],
        ),
      ),
    );
  }
}
