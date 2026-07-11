/// 模型层单元测试：验证 freezed + json_serializable 序列化，以及 SyncEntity 扩展。
///
/// 这些用例覆盖本次修复的关键点：
/// - 19 个 model 补齐 `part 'xxx.g.dart'` 后 fromJson/toJson 正常；
/// - SyncEntity 的派生 getter `isDeleted` 改用 extension 提供，行为不变。
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:family_butler/data/models/base/sync_entity.dart';
import 'package:family_butler/data/models/category.dart';
import 'package:family_butler/data/models/enums.dart';
import 'package:family_butler/data/models/member.dart';
import 'package:family_butler/data/models/stock_batch.dart';

void main() {
  group('CategoryModel 序列化', () {
    final json = {
      'id': 'cat_1',
      'name': '食品',
      'createdAt': '2026-01-01T00:00:00.000Z',
      'updatedAt': '2026-01-01T00:00:00.000Z',
    };

    test('fromJson 正确解析且默认值生效', () {
      final m = CategoryModel.fromJson(json);
      expect(m.id, 'cat_1');
      expect(m.name, '食品');
      expect(m.kind, CategoryKind.other); // @Default
      expect(m.version, 1); // @Default
      expect(m.deletedAt, isNull);
    });

    test('toJson/fromJson 往返一致', () {
      final m = CategoryModel.fromJson(json);
      final out = m.toJson();
      expect(out['id'], 'cat_1');
      expect(out['name'], '食品');
      expect(CategoryModel.fromJson(out), m);
    });
  });

  group('SyncEntity.isDeleted 扩展', () {
    test('未软删 => false', () {
      final active = CategoryModel(
        id: 'a',
        name: 'n',
        createdAt: DateTime.utc(2026),
        updatedAt: DateTime.utc(2026),
      );
      expect(active.isDeleted, isFalse);
    });

    test('已软删(deletedAt 非空) => true', () {
      final deleted = CategoryModel(
        id: 'a',
        name: 'n',
        createdAt: DateTime.utc(2026),
        updatedAt: DateTime.utc(2026),
        deletedAt: DateTime.utc(2026, 6, 1),
      );
      expect(deleted.isDeleted, isTrue);
    });
  });

  group('MemberModel 序列化', () {
    test('构造 + fromJson/toJson 往返一致', () {
      final m = MemberModel(
        id: 'mem_1',
        name: '爸爸',
        color: 0xFF2196F3,
        createdAt: DateTime.utc(2026),
        updatedAt: DateTime.utc(2026),
      );
      expect(m.name, '爸爸');
      expect(MemberModel.fromJson(m.toJson()), m);
    });
  });

  group('StockBatchModel 序列化 (含 json_serializable)', () {
    test('构造 + fromJson/toJson 往返一致', () {
      final m = StockBatchModel(
        id: 'sb_1',
        productId: 'p_1',
        quantity: 3,
        inboundAt: DateTime.utc(2026, 5, 1),
        createdAt: DateTime.utc(2026),
        updatedAt: DateTime.utc(2026),
      );
      expect(m.productId, 'p_1');
      expect(m.quantity, 3);
      expect(StockBatchModel.fromJson(m.toJson()), m);
    });
  });

  group('DateTime UTC 序列化（方案 B：UtcDateTimeConverter）', () {
    test('toJson 把本地 DateTime 强制转 UTC 并以 Z 结尾', () {
      // 故意构造一个本地时区的 DateTime（toUtc 之后再 toJson 必须得到 Z 串）
      final localCreated = DateTime(2026, 7, 11, 8, 0, 0); // 本地 8 点
      final m = MemberModel(
        id: 'm1',
        name: 'A',
        color: 0xFF000000,
        createdAt: localCreated,
        updatedAt: localCreated,
      );
      final json = m.toJson();
      final createdAtStr = json['createdAt'] as String;
      final updatedAtStr = json['updatedAt'] as String;
      // 必须以 'Z' 结尾（cross-repo-conventions §1：UTC ISO Z）
      expect(createdAtStr, endsWith('Z'));
      expect(updatedAtStr, endsWith('Z'));
      // 解析后必须 isUtc == true（防 "8:00:00" 这种无 Z 串被误判本地）
      expect(DateTime.parse(createdAtStr).isUtc, isTrue);
      expect(DateTime.parse(updatedAtStr).isUtc, isTrue);
    });

    test('fromJson 把字符串还原为 UTC DateTime（即使后端漏发 Z 也能容错）', () {
      final json = {
        'id': 'm2',
        'name': 'B',
        'color': 0xFFFFFFFF,
        // 用纯 "YYYY-MM-DDTHH:mm:ss" 字符串（漏发 Z），验证 fromJson 仍能 toUtc
        'createdAt': '2026-07-11T00:00:00.000',
        'updatedAt': '2026-07-11T00:00:00.000Z',
      };
      final m = MemberModel.fromJson(json);
      expect(m.createdAt.isUtc, isTrue,
          reason: 'fromJson 必须把 DateTime.parse 后的本地 DateTime 强制 toUtc');
      expect(m.updatedAt.isUtc, isTrue);
    });

    test('StockBatchModel 的 DateTime? 字段（expireDate）也走 UTC 转换', () {
      final m = StockBatchModel(
        id: 'sb_2',
        productId: 'p_1',
        quantity: 1,
        expireDate: DateTime(2026, 12, 31, 23, 59, 59), // 本地时间
        inboundAt: DateTime(2026, 1, 1, 0, 0, 0), // 本地时间
        createdAt: DateTime.utc(2026),
        updatedAt: DateTime.utc(2026),
      );
      final json = m.toJson();
      expect((json['expireDate'] as String), endsWith('Z'));
      expect((json['inboundAt'] as String), endsWith('Z'));
      // 反序列化后 isUtc == true
      final round = StockBatchModel.fromJson(json);
      expect(round.expireDate?.isUtc, isTrue);
      expect(round.inboundAt.isUtc, isTrue);
    });
  });
}
