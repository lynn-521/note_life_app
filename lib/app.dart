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
  bool _initialized = false;

  Future<void> _init() async {
    if (_initialized) return;
    _initialized = true;
    await ref.read(reminderEngineProvider).init();
    await ensureSeeded(ref);
    await ref.read(reminderEngineProvider).scanAndFireRules();
    // 启动后尝试一次同步（未配置服务器 / 离线时自动忽略，保留本地数据）。
    await ref.read(syncEngineProvider).syncAll();
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
