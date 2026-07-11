/// 备忘录实体（class-diagram.mermaid · MemoModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import '../../core/utils/json_converters.dart';

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
    @UtcDateTimeConverter() DateTime? dueAt,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @Default(1) int version,
    @UtcDateTimeConverter() DateTime? deletedAt,
  }) = _Memo;

  factory MemoModel.fromJson(Map<String, dynamic> json) => _$MemoModelFromJson(json);
}
