/// 模型层单元测试：验证 freezed + json_serializable 序列化，以及 SyncEntity 扩展。
///
/// 这些用例覆盖本次修复的关键点：
/// - 19 个 model 补齐 `part 'xxx.g.dart'` 后 fromJson/toJson 正常；
/// - SyncEntity 的派生 getter `isDeleted` 改用 extension 提供，行为不变。
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
}
