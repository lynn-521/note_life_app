/// 综合家庭管家（Family Butler）入口。
///
/// 本环境无 Flutter SDK，无法运行 build_runner；请本地执行：
///   flutter pub get
///   dart run build_runner build --delete-conflicting-outputs
///   flutter run
library;
import 'package:flutter/widgets.dart';
import 'package:timezone/data/latest.dart' as tz_data;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化时区数据库，供 flutter_local_notifications.zonedSchedule 使用。
  tz_data.initializeTimeZones();
  runApp(const App());
}
