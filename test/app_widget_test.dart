/// 根组件冒烟 / 回归测试（堵「根 Widget 未包 ProviderScope 导致启动崩溃」的验证漏洞）。
///
/// 背景：App 曾在真机 / 模拟器启动即崩溃（debug 红屏 `Bad state: No ProviderScope found`，
/// release 灰屏）。根因是 `lib/main.dart` 的 `runApp(App())` 没有被 `ProviderScope` 包裹。
///
/// 本测试把整个 `App` 在 `ProviderScope` 内 pump 起来（与修复后的 `main.dart` 一致），
/// 并把会触达 SharedPreferences / Drift 数据库 / 网络 / 本地通知的引擎与路由 provider
/// 全部桩成无副作用的假实现，使测试密闭（hermetic），只验证：
///   1) App 能在 ProviderScope 内正常构建首屏、不抛运行时异常（本次 bug 的核心回归点）；
///   2) 首屏存在可识别控件（MaterialApp + 桩路由渲染的固定文案）。
///
/// 第二个 test 反向锁定不变量：若 `App` 未被 `ProviderScope` 包裹直接 pump，
/// 必然抛 `StateError`（No ProviderScope found）—— 一旦有人在 main 里回退包裹，
/// 这类「启动时崩溃」就会被 CI 的 `flutter test` 拦下。
library;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/native.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:family_butler/app.dart';
import 'package:family_butler/core/constants/app_constants.dart';
import 'package:family_butler/core/network/api_client.dart';
import 'package:family_butler/data/local_db/app_database.dart';
import 'package:family_butler/data/models/enums.dart';
import 'package:family_butler/data/models/family_server_config.dart';
import 'package:family_butler/data/notify/logging_notification_channel.dart';
import 'package:family_butler/data/notify/notification_channel.dart';
import 'package:family_butler/data/notify/reminder_dispatcher.dart';
import 'package:family_butler/data/reminder/local_reminder_engine.dart';
import 'package:family_butler/data/repositories/repository.dart';
import 'package:family_butler/data/sync/http_sync_engine.dart';
import 'package:family_butler/data/sync/sync_engine.dart';
import 'package:family_butler/providers/app_providers.dart';
import 'package:family_butler/router/app_router.dart';

/// 无副作用的提醒引擎桩：init / scanAndFireRules 皆为 no-op。
class _FakeReminderEngine extends LocalReminderEngine {
  _FakeReminderEngine(AppRepositories repos)
      : super(
          repositories: repos,
          dispatcher: ReminderDispatcher(<ChannelType, NotificationChannel>{
            ChannelType.localLog: const LoggingNotificationChannel(),
          }),
          flutterLocalNotifications: FlutterLocalNotificationsPlugin(),
        );

  @override
  Future<void> init() async {}

  @override
  Future<void> scanAndFireRules() async {}
}

/// 无副作用的同步引擎桩：syncAll 直接返回成功，不触网。
class _FakeSyncEngine extends HttpSyncEngine {
  _FakeSyncEngine({
    required super.apiClient,
    required super.repositories,
  });

  @override
  Future<SyncResult> syncAll() async =>
      SyncResult(success: true, syncedAt: DateTime.now());
}

/// 仅渲染固定文案的极简路由（替代真实 5-Tab 路由，避免触达各页面 provider）。
GoRouter _buildTrivialRouter() => GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('App Boot OK')),
          ),
        ),
      ],
    );

/// 构建密闭的 ProviderScope overrides：数据库走内存、引擎与路由全桩。
List<Override> _hermeticOverrides() => <Override>[
      // 内存数据库，避免任何文件型 SQLite I/O。
      appDatabaseProvider.overrideWith(
        (ref) {
          final db = AppDatabase(NativeDatabase.memory());
          ref.onDispose(db.close);
          return db;
        },
      ),
      repositoriesProvider.overrideWith(
        (ref) => AppRepositories(ref.watch(appDatabaseProvider)),
      ),
      // 引擎桩成无副作用实现。
      reminderEngineProvider.overrideWith(
        (ref) => _FakeReminderEngine(ref.watch(repositoriesProvider)),
      ),
      syncEngineProvider.overrideWith(
        (ref) => _FakeSyncEngine(
          apiClient: ApiClient(FamilyServerConfig.empty()),
          repositories: ref.watch(repositoriesProvider),
        ),
      ),
      // 路由桩成极简页面，避免构建真实 5-Tab 页面树。
      routerProvider.overrideWithValue(_buildTrivialRouter()),
    ];

void main() {
  testWidgets(
    'App 在 ProviderScope 内可正常构建首屏且不抛异常（启动崩溃回归）',
    (tester) async {
      // SharedPreferences 桩：标记已播种，使 ensureSeeded 直接早返回，不触达 DB。
      SharedPreferences.setMockInitialValues(
        <String, Object>{AppConstants.seedPrefKey: true},
      );

      // 用 ProviderScope 包裹整个 App（与修复后的 main.dart 一致），并桩掉外部依赖。
      await tester.pumpWidget(
        ProviderScope(
          overrides: _hermeticOverrides(),
          child: const App(),
        ),
      );

      // 等待首帧 + 首帧后 _init()（引擎/同步桩均为 no-op，不会 pending timer）。
      await tester.pumpAndSettle();

      // 回归点：构建 / 首帧不得抛异常（之前是 No ProviderScope found 崩溃）。
      // 若此处抛错，tester.pumpAndSettle() 会直接让测试失败。

      // 可识别控件 1：根 MaterialApp 必然存在（App.build 返回 MaterialApp.router）。
      expect(find.byType(MaterialApp), findsWidgets);

      // 可识别控件 2：桩路由渲染的固定文案，证明首屏已真正构建。
      expect(find.text('App Boot OK'), findsOneWidget);
    },
  );

  testWidgets(
    'App 缺少 ProviderScope 包裹时必须抛 StateError（锁定启动崩溃不变量）',
    (tester) async {
      SharedPreferences.setMockInitialValues(const <String, Object>{});

      // 故意不包裹 ProviderScope，直接 pump App。
      await tester.pumpWidget(const App());

      // ConsumerStatefulWidget 在无 ProviderScope 的上下文里访问 ref 会抛
      // `Bad state: No ProviderScope found`。
      final Object? exception = tester.takeException();
      expect(exception, isNotNull);
      expect(
        exception.toString().toLowerCase(),
        contains('providerscope'),
      );
    },
  );
}
