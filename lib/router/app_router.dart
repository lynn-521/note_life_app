/// 应用路由（system_design §1.5 / T10）。
///
/// go_router + StatefulShellRoute：5 个底部 Tab 各自独立 Navigator；
/// 仓库子视图（入库 / 临期）作为嵌套路由。
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/dining/dining_page.dart';
import '../features/health/health_page.dart';
import '../features/life/life_page.dart';
import '../features/mine/mine_page.dart';
import '../features/mine/server_settings_page.dart';
import '../features/shared/app_scaffold.dart';
import '../features/storage/storage_page.dart';
import '../features/storage/sub_views/expiring_view.dart';
import '../features/storage/sub_views/inbound_form_view.dart';

/// 全局路由 Provider（app.dart 引用）。
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/storage',
    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/storage',
              builder: (context, state) => const StoragePage(),
              routes: [
                GoRoute(
                  path: 'inbound',
                  builder: (context, state) => const InboundFormView(),
                ),
                GoRoute(
                  path: 'expiring',
                  builder: (context, state) => const ExpiringView(),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/health',
              builder: (context, state) => const HealthPage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/dining',
              builder: (context, state) => const DiningPage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/life',
              builder: (context, state) => const LifePage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/mine',
              builder: (context, state) => const MinePage(),
              routes: [
                GoRoute(
                  path: 'server',
                  builder: (context, state) => const ServerSettingsPage(),
                ),
              ],
            ),
          ]),
        ],
        builder: (context, state, shell) => AppScaffold(shell: shell),
      ),
    ],
  );
});
