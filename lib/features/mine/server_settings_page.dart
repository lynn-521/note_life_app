/// 服务器设置页（backend_design §2.1 / E）。
///
/// 填写内网 / 外网地址与共享密钥（FAMILY_TOKEN），持久化到 [FamilyServerConfig]；
/// 用 [ApiClient.isReachable] 探测「当前可达地址」（内网 / 外网 / 不可达）；
/// 支持「立即同步」触发一次 HttpSyncEngine.syncAll。视觉严格走设计令牌。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/network/api_client.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';
import '../../data/models/family_server_config.dart';
import '../../features/shared/app_badge.dart';
import '../../features/shared/app_button.dart';
import '../../features/shared/app_card.dart';
import '../../features/shared/toast.dart';
import '../../providers/app_providers.dart';

/// 服务器设置页根 Widget。
class ServerSettingsPage extends ConsumerWidget {
  /// 构造。
  const ServerSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: ref.watch(familyServerConfigProvider).when(
              data: (cfg) => _SettingsForm(initial: cfg),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => const Center(child: Text('配置加载失败')),
            ),
      ),
    );
  }
}

/// 设置表单（从已加载配置初始化输入框）。
class _SettingsForm extends StatefulWidget {
  const _SettingsForm({required this.initial});

  final FamilyServerConfig initial;

  @override
  State<_SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<_SettingsForm> {
  late final TextEditingController _internal;
  late final TextEditingController _external;
  late final TextEditingController _token;
  bool _obscure = true;
  bool _testing = false;
  bool _syncing = false;
  String? _reachability; // '内网' | '外网' | '不可达' | null

  @override
  void initState() {
    super.initState();
    _internal = TextEditingController(text: widget.initial.internalBaseUrl);
    _external = TextEditingController(text: widget.initial.externalBaseUrl);
    _token = TextEditingController(text: widget.initial.token);
  }

  @override
  void dispose() {
    _internal.dispose();
    _external.dispose();
    _token.dispose();
    super.dispose();
  }

  FamilyServerConfig _buildConfig() => FamilyServerConfig(
        internalBaseUrl: _internal.text.trim(),
        externalBaseUrl: _external.text.trim(),
        token: _token.text.trim(),
      );

  Future<void> _testConnection() async {
    setState(() => _testing = true);
    final client = ApiClient(_buildConfig());
    final internalOk = await client.isReachable(_internal.text.trim());
    final externalOk = await client.isReachable(_external.text.trim());
    if (mounted) {
      setState(() {
        _testing = false;
        _reachability = internalOk
            ? '内网'
            : externalOk
                ? '外网'
                : '不可达';
      });
    }
  }

  Future<void> _save(WidgetRef ref) async {
    final cfg = _buildConfig();
    await ref.read(familyServerConfigProvider.notifier).save(cfg);
    if (mounted) showAppToast(context, '已保存服务器设置 ✅');
  }

  Future<void> _syncNow(WidgetRef ref) async {
    setState(() => _syncing = true);
    final res = await ref.read(syncEngineProvider).syncAll();
    if (mounted) {
      setState(() => _syncing = false);
      ref.invalidate(lastSyncAtProvider);
      showAppToast(
        context,
        res.success ? '同步完成 ✅' : '同步未成功（离线或未配置）',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        const ScreenHeaderBack(title: '服务器设置'),
        const SizedBox(height: 12),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('连接地址',
                  style: AppTextStyles.sans(16, weight: FontWeight.w800)
                      .copyWith(color: theme.textPrimary)),
              const SizedBox(height: 12),
              _Field(
                label: '内网地址',
                hint: 'http://192.168.1.20:8000',
                controller: _internal,
              ),
              const SizedBox(height: 12),
              _Field(
                label: '外网地址',
                hint: 'https://note-life.example.com',
                controller: _external,
              ),
              const SizedBox(height: 12),
              _Field(
                label: '共享密钥（FAMILY_TOKEN）',
                hint: '与后端 docker-compose 的 FAMILY_TOKEN 一致',
                controller: _token,
                obscure: _obscure,
                onToggleObscure: () => setState(() => _obscure = !_obscure),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (ctx, ref, _) => Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: _testing ? '探测中…' : '测试连接',
                        kind: AppButtonKind.secondary,
                        onPressed: _testing ? null : () => _testConnection(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppButton(
                        label: '保存',
                        onPressed: () => _save(ref),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _ReachabilityRow(reachability: _reachability),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('同步',
                  style: AppTextStyles.sans(16, weight: FontWeight.w800)
                      .copyWith(color: theme.textPrimary)),
              const SizedBox(height: 8),
              Text('本地优先：离线照常落库，联网后自动重放。',
                  style: AppTextStyles.sans(13)
                      .copyWith(color: theme.textSecondary)),
              const SizedBox(height: 12),
              Consumer(
                builder: (ctx, ref, _) => AppButton(
                  label: _syncing ? '同步中…' : '立即同步',
                  block: true,
                  onPressed: _syncing ? null : () => _syncNow(ref),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 单个输入字段（令牌可隐藏）。
class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.hint,
    required this.controller,
    this.obscure = false,
    this.onToggleObscure,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback? onToggleObscure;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.sans(13, weight: FontWeight.w700)
                .copyWith(color: theme.textSecondary)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                AppTextStyles.sans(13).copyWith(color: theme.textTertiary),
            filled: true,
            fillColor: theme.surface2,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.radiusInput),
              borderSide: BorderSide(color: theme.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.radiusInput),
              borderSide: BorderSide(color: theme.border),
            ),
            suffixIcon: onToggleObscure == null
                ? null
                : IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      color: theme.textSecondary,
                    ),
                    onPressed: onToggleObscure,
                  ),
          ),
          style: AppTextStyles.sans(14).copyWith(color: theme.textPrimary),
        ),
      ],
    );
  }
}

/// 可达性探测结果。
class _ReachabilityRow extends StatelessWidget {
  const _ReachabilityRow({this.reachability});

  final String? reachability;

  @override
  Widget build(BuildContext context) {
    if (reachability == null) return const SizedBox.shrink();
    final kind = reachability == '不可达'
        ? BadgeKind.danger
        : BadgeKind.success;
    return Row(
      children: [
        AppBadge(kind: kind, text: '$reachability可达'),
      ],
    );
  }
}

/// 带返回的头部。
class ScreenHeaderBack extends StatelessWidget {
  const ScreenHeaderBack({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: theme.surface,
                shape: BoxShape.circle,
                boxShadow: [theme.shadows.xs],
              ),
              child: const Center(
                  child: Text('‹', style: TextStyle(fontSize: 24))),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.display(24, weight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
