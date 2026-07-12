/// BarcodeScannerPage widget test（密闭环境：跳过真实相机与平台权限通道）。
///
/// 策略：
/// 1. 注入 [permissionRequester] 走快速路径（直接 `true`），避免
///    `permission_handler` 在 `flutter test` 缺平台通道时挂起。
/// 2. 在 `MobileScanner` 子树上找到该 widget 实例，**直接调用其 `onDetect`
///    回调**喂一条假 `BarcodeCapture`，跳过真实扫码。
/// 3. 断言 `Navigator.pop` 回传的字符串 == 喂入的 `rawValue`。
///
/// 同时覆盖：
/// - 「关闭按钮」tap 走 `Navigator.pop`（无回传值）。
/// - 权限被拒场景：注入 [permissionRequester] 返回 `false`，断言展示兜底文案。
library;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:family_butler/core/theme/app_theme_extension.dart';
import 'package:family_butler/features/storage/scan/barcode_scanner_page.dart';

/// 注入 AppTheme 扩展的测试 MaterialApp（扫码页内 `AppTheme.of(context)`
/// 走 ThemeData.extensions；裸 MaterialApp 会让 `!` 抛 Null check operator）。
Widget _wrap(Widget child, {String? initialRouteName, Widget? home}) {
  return MaterialApp(
    theme: ThemeData(extensions: [AppTheme.light()]),
    home: home,
    onGenerateRoute: (settings) => MaterialPageRoute(
      settings: settings,
      builder: (ctx) => child,
    ),
  );
}

void main() {
  group('BarcodeScannerPage', () {
    testWidgets('检测到 barcode → Navigator.pop 回传 rawValue', (tester) async {
      // 注入权限快速通过。
      final scannerPage = BarcodeScannerPage(
        permissionRequester: () async => true,
      );
      String? popped;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [AppTheme.light()]),
          home: Builder(
            builder: (rootCtx) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    popped = await Navigator.of(rootCtx).push<String>(
                      MaterialPageRoute(
                        builder: (_) => scannerPage,
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      );
      // 打开扫码页。
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      // 找到 MobileScanner 节点，喂入一条假检测。
      final scannerFinder = find.byType(MobileScanner);
      expect(scannerFinder, findsOneWidget);
      final scannerWidget = tester.widget<MobileScanner>(scannerFinder);
      scannerWidget.onDetect?.call(
        BarcodeCapture(
          barcodes: [Barcode(rawValue: '6901234567890')],
        ),
      );
      // pop 是异步的，等待一帧 + Navigator 动画。
      await tester.pumpAndSettle();

      // 断言：回传值 == '6901234567890'。
      expect(popped, '6901234567890');
    });

    testWidgets('关闭按钮 → Navigator.pop(null)', (tester) async {
      String? popped;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [AppTheme.light()]),
          home: Builder(
            builder: (rootCtx) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    popped = await Navigator.of(rootCtx).push<String>(
                      MaterialPageRoute(
                        builder: (_) => BarcodeScannerPage(
                          permissionRequester: () async => true,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      // 点击关闭按钮（右上角 Icons.close）。
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(popped, isNull);
    });

    testWidgets('权限被拒 → 展示「需要相机权限」兜底视图', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [AppTheme.light()]),
          home: BarcodeScannerPage(
            permissionRequester: () async => false,
          ),
        ),
      );
      // 等 addPostFrameCallback 跑完 → setState → rebuild。
      await tester.pumpAndSettle();
      expect(find.text('需要相机权限才能扫码'), findsOneWidget);
      expect(find.text('重试'), findsOneWidget);
      expect(find.text('返回'), findsOneWidget);
    });
  });
}
