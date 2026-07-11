/// Memos 表（class-diagram.mermaid · MemoModel）。
library;
import 'package:drift/drift.dart';

/// 备忘录表。
class Memos extends Table {
  String get dataClassName => 'MemoRow';

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get body => text().withDefault(const Constant(''))();

  TextColumn get authorId => text()();

  BoolColumn get pinned => boolean().withDefault(const Constant(false))();

  BoolColumn get done => boolean().withDefault(const Constant(false))();

  DateTimeColumn get dueAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer().withDefault(const Constant(1))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
