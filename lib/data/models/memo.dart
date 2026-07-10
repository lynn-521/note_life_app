/// 备忘录实体（class-diagram.mermaid · Memo）。
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'memo.freezed.dart';

/// 备忘录：置顶 / 完成 / 到期（可选）。
@freezed
class Memo with _$Memo, SyncEntity {
  const factory Memo({
    required String id,
    required String title,
    @Default('') String body,
    required String authorId,
    @Default(false) bool pinned,
    @Default(false) bool done,
    DateTime? dueAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
