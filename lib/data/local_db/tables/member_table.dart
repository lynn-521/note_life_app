/// Members 表（class-diagram.mermaid · Member）。
import 'package:drift/drift.dart';

import '../../models/enums.dart';
import '../converters/drift_converters.dart';

/// 家庭成员表。
class Members extends Table {
  @override
  String get dataClassName => 'MemberRow';

  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get avatar => text().nullable()();

  TextColumn get role => text().map(const EnumConverter<MemberRole>(MemberRole.values))();

  TextColumn get wxUid => text().nullable()();

  IntColumn get color => integer()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
