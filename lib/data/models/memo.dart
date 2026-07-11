/// 备忘录实体（class-diagram.mermaid · MemoModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

/// 备忘录：置顶 / 完成 / 到期（可选）。
@freezed
class MemoModel with _$MemoModel, SyncEntity {
  const factory MemoModel({
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

  factory MemoModel.fromJson(Map<String, dynamic> json) => _$MemoModelFromJson(json);
}
