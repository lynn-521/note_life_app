/// 成员颜色映射：member-1..6 令牌 → 颜色（DESIGN.md §4 Avatar Dot）。
///
/// 与 [AppTheme.memberColors] 顺序一致：爸 / 妈 / 宝 / 奶 / 爷 / 其他。
import 'package:flutter/material.dart';

class MemberColors {
  MemberColors._();

  /// 调色板（int 值，可直接存入 Member.color）。
  static const List<int> palette = <int>[
    0xFFFF7A59, // member-1 爸爸
    0xFF4DA3FF, // member-2 妈妈
    0xFFF2C94C, // member-3 孩子
    0xFFFF7AA8, // member-4 奶奶
    0xFF36C58A, // member-5 爷爷
    0xFF9B8CFF, // member-6 其他
  ];

  /// 取第 index 个成员色（越界回退到「其他」）。
  static Color ofIndex(int index) =>
      Color(palette[index.clamp(0, palette.length - 1)]);

  /// 取颜色值对应的 Color（Member.color 即 int 值）。
  static Color ofValue(int value) => Color(value);
}
