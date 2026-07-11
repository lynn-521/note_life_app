/// InventoryDao（class-diagram.mermaid · InventoryDao）。
///
/// 商品 / 分类 / 批次 / 入库 / 出库 + 库存聚合（Σ入库 − Σ出库）。
library;
import 'package:drift/drift.dart';

import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../models/category.dart';
import '../../models/enums.dart';
import '../../models/inbound_order.dart';
import '../../models/outbound_order.dart';
import '../../models/product.dart';
import '../../models/stock_batch.dart';
import '../../models/stock_view.dart';
import '../tables/category_table.dart';
import '../tables/inbound_order_table.dart';
import '../tables/outbound_order_table.dart';
import '../tables/product_table.dart';
import '../tables/stock_batch_table.dart';
import 'base_dao.dart';
import '../app_database.dart';
part 'inventory_dao.g.dart';

/// 库存数据访问。
@DriftAccessor(tables: [
  Products,
  Categories,
  StockBatches,
  InboundOrders,
  OutboundOrders,
])
class InventoryDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryDaoMixin, BaseDao {
  /// 构造。
  InventoryDao(super.db);

  // —— 商品 ——
  Stream<List<ProductModel>> watchProducts() =>
      (select(products)..where((t) => t.deletedAt.isNull()))
          .watch()
          .map((rows) => rows.map(_toProduct).toList());

  Future<List<ProductModel>> getAllProducts() async =>
      (await (select(products)..where((t) => t.deletedAt.isNull())).get())
          .map(_toProduct)
          .toList();

  Future<ProductModel?> getProduct(String id) async {
    final row = await (select(products)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toProduct(row);
  }

  Future<void> saveProduct(ProductModel p) =>
      into(products).insertOnConflictUpdate(_toProductCompanion(p));

  Future<void> softDeleteProduct(String id) =>
      (update(products)..where((t) => t.id.equals(id)))
          .write(ProductsCompanion(deletedAt: Value(now)));

  // —— 分类 ——
  Stream<List<CategoryModel>> watchCategories() =>
      (select(categories)..where((t) => t.deletedAt.isNull()))
          .watch()
          .map((rows) => rows.map(_toCategory).toList());

  Future<List<CategoryModel>> getAllCategories() async =>
      (await (select(categories)..where((t) => t.deletedAt.isNull())).get())
          .map(_toCategory)
          .toList();

  Future<void> saveCategory(CategoryModel c) =>
      into(categories).insertOnConflictUpdate(_toCategoryCompanion(c));

  /// 获取全部商品（含软删，供同步推送使用，确保删除能传播到远端）。
  Future<List<ProductModel>> getAllProductsForSync() async =>
      (await select(products).get()).map(_toProduct).toList();

  /// 获取全部分类（含软删，供同步推送使用）。
  Future<List<CategoryModel>> getAllCategoriesForSync() async =>
      (await select(categories).get()).map(_toCategory).toList();

  /// 获取全部批次（供同步推送使用）。
  Future<List<StockBatchModel>> getAllStockBatchesForSync() async =>
      (await select(stockBatches).get()).map(_toStockBatch).toList();

  /// 获取全部入库流水（供同步推送使用）。
  Future<List<InboundOrderModel>> getAllInboundForSync() async =>
      (await select(inboundOrders).get()).map(_toInbound).toList();

  /// 获取全部出库流水（供同步推送使用）。
  Future<List<OutboundOrderModel>> getAllOutboundForSync() async =>
      (await select(outboundOrders).get()).map(_toOutbound).toList();

  // —— 批次 ——
  Stream<List<StockBatchModel>> watchStockBatches(String productId) =>
      (select(stockBatches)
            ..where((t) => t.productId.equals(productId))
            ..orderBy([(t) => OrderingTerm.desc(t.inboundAt)]))
          .watch()
          .map((rows) => rows.map(_toStockBatch).toList());

  // —— 入库 / 出库（事件溯源）——
  Future<void> recordInbound({
    required String productId,
    required num qty,
    required String operatorId,
    String? batchNo,
    DateTime? expireDate,
    String? note,
  }) async {
    final at = DateTime.now();
    final batch = StockBatchModel(
      id: IdGenerator.newId(IdPrefix.batch),
      productId: productId,
      quantity: qty,
      expireDate: expireDate,
      batchNo: batchNo,
      inboundAt: at,
      createdAt: at,
      updatedAt: at,
      version: 1,
    );
    final inbound = InboundOrderModel(
      id: IdGenerator.newId(IdPrefix.inbound),
      productId: productId,
      qty: qty,
      operatorId: operatorId,
      at: at,
      note: note,
      createdAt: at,
      updatedAt: at,
      version: 1,
    );
    await db.transaction(() async {
      await into(stockBatches).insert(_toStockBatchCompanion(batch));
      await into(inboundOrders).insert(_toInboundCompanion(inbound));
    });
  }

  Future<void> recordOutbound({
    required String productId,
    required num qty,
    required OutboundReason reason,
    required String operatorId,
    String? note,
  }) async {
    final at = DateTime.now();
    final outbound = OutboundOrderModel(
      id: IdGenerator.newId(IdPrefix.outbound),
      productId: productId,
      qty: qty,
      reason: reason,
      operatorId: operatorId,
      at: at,
      note: note,
      createdAt: at,
      updatedAt: at,
      version: 1,
    );
    await into(outboundOrders).insert(_toOutboundCompanion(outbound));
  }

  /// 批次 upsert（供远端变更合并）。
  Future<void> upsertStockBatch(StockBatchModel b) =>
      into(stockBatches).insertOnConflictUpdate(_toStockBatchCompanion(b));

  /// 入库流水 upsert（供远端变更合并）。
  Future<void> upsertInbound(InboundOrderModel o) =>
      into(inboundOrders).insertOnConflictUpdate(_toInboundCompanion(o));

  /// 出库流水 upsert（供远端变更合并）。
  Future<void> upsertOutbound(OutboundOrderModel o) =>
      into(outboundOrders).insertOnConflictUpdate(_toOutboundCompanion(o));

  // —— 聚合查询 ——
  /// 当前库存 = Σ入库 − Σ出库。
  Future<num> currentStock(String productId) async {
    final inb = await (select(inboundOrders)
          ..where((t) => t.productId.equals(productId)))
        .get();
    final out = await (select(outboundOrders)
          ..where((t) => t.productId.equals(productId)))
        .get();
    final inSum = inb.fold<num>(0, (s, e) => s + e.qty);
    final outSum = out.fold<num>(0, (s, e) => s + e.qty);
    return inSum - outSum;
  }

  /// 临期：expireDate 在 [today, today+days] 内。
  Future<List<StockView>> expiringSoon(int days) async {
    final today = DateTimeX.today;
    final limit = today.add(Duration(days: days));
    final rows = await (select(stockBatches)
          ..where((t) =>
              t.expireDate.isNotNull() &
              t.expireDate.isSmallerOrEqualValue(limit) &
              t.expireDate.isBiggerOrEqualValue(today))
          ..orderBy([(t) => OrderingTerm.asc(t.expireDate)]))
        .get();
    final result = <StockView>[];
    for (final b in rows) {
      final product = await getProduct(b.productId);
      if (product == null) continue;
      final stock = await currentStock(b.productId);
      final expire = b.expireDate!;
      final daysLeft = today.daysUntil(expire);
      result.add(StockView(
        product: product,
        batch: _toStockBatch(b),
        currentStock: stock,
        daysLeft: daysLeft,
      ));
    }
    return result;
  }

  /// 低库存：currentStock ≤ 商品阈值。
  Future<List<StockView>> lowStock() async {
    final products = await getAllProducts();
    final result = <StockView>[];
    for (final p in products) {
      final stock = await currentStock(p.id);
      if (stock <= p.lowStockThreshold) {
        result.add(StockView(
          product: p,
          batch: null,
          currentStock: stock,
          daysLeft: null,
        ));
      }
    }
    return result;
  }

  // —— 映射 ——
  ProductModel _toProduct(Product r) => ProductModel(
        id: r.id,
        name: r.name,
        categoryId: r.categoryId,
        unit: r.unit,
        barcode: r.barcode,
        location: r.location,
        lowStockThreshold: r.lowStockThreshold,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  CategoryModel _toCategory(Category r) => CategoryModel(
        id: r.id,
        name: r.name,
        kind: r.kind,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  StockBatchModel _toStockBatch(StockBatche r) => StockBatchModel(
        id: r.id,
        productId: r.productId,
        quantity: r.quantity,
        expireDate: r.expireDate,
        batchNo: r.batchNo,
        inboundAt: r.inboundAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  InboundOrderModel _toInbound(InboundOrder r) => InboundOrderModel(
        id: r.id,
        productId: r.productId,
        qty: r.qty,
        operatorId: r.operatorId,
        at: r.at,
        note: r.note,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  OutboundOrderModel _toOutbound(OutboundOrder r) => OutboundOrderModel(
        id: r.id,
        productId: r.productId,
        qty: r.qty,
        reason: r.reason,
        operatorId: r.operatorId,
        at: r.at,
        note: r.note,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  ProductsCompanion _toProductCompanion(ProductModel m) => ProductsCompanion(
        id: Value(m.id),
        name: Value(m.name),
        categoryId: Value(m.categoryId),
        unit: Value(m.unit),
        barcode: Value(m.barcode),
        location: Value(m.location),
        lowStockThreshold: Value(m.lowStockThreshold),
        createdAt: Value(m.createdAt),
        updatedAt: Value(m.updatedAt),
        version: Value(m.version),
        deletedAt: Value(m.deletedAt),
      );

  CategoriesCompanion _toCategoryCompanion(CategoryModel c) =>
      CategoriesCompanion(
        id: Value(c.id),
        name: Value(c.name),
        kind: Value(c.kind),
        createdAt: Value(c.createdAt),
        updatedAt: Value(c.updatedAt),
        version: Value(c.version),
        deletedAt: Value(c.deletedAt),
      );

  StockBatchesCompanion _toStockBatchCompanion(StockBatchModel b) =>
      StockBatchesCompanion(
        id: Value(b.id),
        productId: Value(b.productId),
        quantity: Value(b.quantity.toDouble()),
        expireDate: Value(b.expireDate),
        batchNo: Value(b.batchNo),
        inboundAt: Value(b.inboundAt),
        createdAt: Value(b.createdAt),
        updatedAt: Value(b.updatedAt),
        version: Value(b.version),
        deletedAt: Value(b.deletedAt),
      );

  InboundOrdersCompanion _toInboundCompanion(InboundOrderModel o) =>
      InboundOrdersCompanion(
        id: Value(o.id),
        productId: Value(o.productId),
        qty: Value(o.qty.toDouble()),
        operatorId: Value(o.operatorId),
        at: Value(o.at),
        note: Value(o.note),
        createdAt: Value(o.createdAt),
        updatedAt: Value(o.updatedAt),
        version: Value(o.version),
        deletedAt: Value(o.deletedAt),
      );

  OutboundOrdersCompanion _toOutboundCompanion(OutboundOrderModel o) =>
      OutboundOrdersCompanion(
        id: Value(o.id),
        productId: Value(o.productId),
        qty: Value(o.qty.toDouble()),
        reason: Value(o.reason),
        operatorId: Value(o.operatorId),
        at: Value(o.at),
        note: Value(o.note),
        createdAt: Value(o.createdAt),
        updatedAt: Value(o.updatedAt),
        version: Value(o.version),
        deletedAt: Value(o.deletedAt),
      );
}
