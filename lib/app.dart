/// 应用根组件：装配主题、路由、Provider，并在首帧后初始化提醒引擎与种子数据。
library;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme_extension.dart';
import 'core/theme/design_tokens.dart';
import 'core/theme/text_styles.dart';
import 'data/seed/seed_data.dart';
import 'providers/app_providers.dart';
import 'router/app_router.dart';

/// 应用根 Widget。
class App extends ConsumerStatefulWidget {
  /// 构造。
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  /// 启动初始化状态机（三态）。
  ///
  /// 策略（防 false-positive 自锁）：
  /// - 旧实现用 `bool _initialized`，一旦置 true 就再也不会重试；
  ///   若第一次 `await` 中途抛错（DB 锁、SharedPreferences 损坏等），后续
  ///   build 的 addPostFrameCallback 会直接 early-return，本地数据**永远**
  ///   得不到提醒引擎 / 种子数据 / 首次同步。
  /// - 新实现三态：
  ///   * [idle] —— 等待下次 build 触发；
  ///   * [running] —— 正在执行，所有 addPostFrameCallback 重入会被忽略；
  ///   * [done] —— 全部 await 成功完成，不再重试。
  /// - 失败时回到 [idle]：下次 build 触发 addPostFrameCallback 时自然重试，
  ///   不需要全局 setState 触发。
  _InitState _initState = _InitState.idle;

  Future<void> _init() async {
    if (_initState == _InitState.done || _initState == _InitState.running) {
      return;
    }
    _initState = _InitState.running;
    try {
      await ref.read(reminderEngineProvider).init();
      await ensureSeeded(ref);
      await ref.read(reminderEngineProvider).scanAndFireRules();
      // 启动后尝试一次同步（未配置服务器 / 离线时自动忽略，保留本地数据）。
      await ref.read(syncEngineProvider).syncAll();
      _initState = _InitState.done;
    } catch (e, st) {
      // 任意一步失败：回到 idle，下次 build 触发 addPostFrameCallback 时重试。
      // debugPrint 而非 print（与 http_sync_engine 一致）。
      debugPrint('[App] 启动初始化失败，下次 build 重试: $e\n$st');
      _initState = _InitState.idle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    // 首帧后初始化提醒引擎并写入种子数据（仅首次）。
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());

    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        surface: AppColors.surface,
        primary: AppColors.primary,
        onPrimary: AppColors.textPrimary, // 主色亮面用深字（DESIGN §7 Never Do）
        secondary: AppColors.secondary,
        onSecondary: AppColors.textPrimary,
        error: AppColors.danger,
        onError: AppColors.textInverse,
        outline: AppColors.border,
      ),
      textTheme: TextTheme(
        bodyMedium: AppTextStyles.sans(16, color: AppColors.textPrimary),
        bodySmall: AppTextStyles.sans(14, color: AppColors.textSecondary),
        titleMedium: AppTextStyles.display(20, weight: FontWeight.w600),
        titleLarge: AppTextStyles.display(24, weight: FontWeight.w700),
        labelLarge: AppTextStyles.sans(16, weight: FontWeight.w700),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: AppColors.textPrimary.withValues(alpha: 0.06),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          shadowColor: AppColors.primary.withValues(alpha: 0.28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          minimumSize: const Size(0, 48),
          textStyle: AppTextStyles.sans(16, weight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryInk,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bg,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: AppTextStyles.display(24, weight: FontWeight.w700),
      ),
      extensions: [AppTheme.light()],
    );

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh', 'CN'), Locale('en')],
    );
  }
}

/// 启动初始化状态机（见 [_AppState._init] 注释）。
enum _InitState {
  /// 待初始化：等待下次 build 触发 addPostFrameCallback。
  idle,

  /// 初始化进行中：所有重入会被忽略，防止并发 await 抢资源。
  running,

  /// 初始化完成且全部 await 成功。
  done,
}
