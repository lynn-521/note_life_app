/// DoseLogs 表（class-diagram.mermaid · DoseLogModel）。
///
/// 补同步列 createdAt/updatedAt/version/deletedAt，与 App 端 [DoseLogModel]（已实现
/// [SyncEntity]）及 backend_design §1.4.1 全表同步列约定保持一致。
library;
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 服药记录表。
class DoseLogs extends Table {
  String get dataClassName => 'DoseLogRow';

  TextColumn get id => text()();

  TextColumn get medicationId => text()();

  TextColumn get memberId => text()();

  DateTimeColumn get scheduledTime => dateTime()();

  TextColumn get status =>
      text().map(const EnumConverter<DoseStatus>(DoseStatus.values))();

  DateTimeColumn get takenAt => dateTime().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
