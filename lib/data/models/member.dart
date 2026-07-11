/// 家庭成员实体（class-diagram.mermaid · MemberModel）。
library;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/sync_entity.dart';
import 'enums.dart';

part 'member.freezed.dart';

/// 家庭成员：爸 / 妈 / 宝 / 奶 / 爷 / 其他。
///
/// [color] 存 int（来自 [core/constants/member_colors.dart] 调色板）。
@freezed
class MemberModel with _$MemberModel, SyncEntity {
  const factory MemberModel({
    required String id,
    required String name,
    String? avatar,
    @Default(MemberRole.member) MemberRole role,
    String? wxUid,
    required int color,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(1) int version,
    DateTime? deletedAt,
  }) = _Member;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
