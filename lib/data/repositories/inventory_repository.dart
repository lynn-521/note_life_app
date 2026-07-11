/// InventoryRepository（class-diagram.mermaid · InventoryRepository）。
library;
import '../models/category.dart';
import '../models/enums.dart';
import '../models/product.dart';
import '../models/stock_view.dart';
import '../local_db/app_database.dart';

/// 库存仓储接口（事件溯源 + 聚合查询）。
abstract class InventoryRepository {
  /// 入库（写 InboundOrderModel + StockBatchModel）。
  Future<void> recordInbound({
    required String productId,
    required num qty,
    required String operatorId,
    String? batchNo,
    DateTime? expireDate,
    String? note,
  });

  /// 出库（写 OutboundOrderModel）。
  Future<void> recordOutbound({
    required String productId,
    required num qty,
    required OutboundReason reason,
    required String operatorId,
    String? note,
  });

  /// 当前库存 = Σ入库 − Σ出库。
  Future<num> currentStock(String productId);

  /// 临期视图（expireDate 在 [today, today+days] 内）。
  Future<List<StockView>> expiringSoon(int days);

  /// 低库存视图（currentStock ≤ 阈值）。
  Future<List<StockView>> lowStock();

  /// 监听商品。
  Stream<List<ProductModel>> watchProducts();

  /// 获取商品。
  Future<List<ProductModel>> getProducts();

  /// 按 id 获取商品。
  Future<ProductModel?> getProduct(String id);

  /// 保存商品。
  Future<void> saveProduct(ProductModel product);

  /// 软删商品。
  Future<void> deleteProduct(String id);

  /// 监听分类。
  Stream<List<CategoryModel>> watchCategories();

  /// 获取分类。
  Future<List<CategoryModel>> getCategories();

  /// 保存分类。
  Future<void> saveCategory(CategoryModel category);
}

/// 基于 Drift 的实现。
class InventoryRepositoryImpl implements InventoryRepository {
  /// 构造。
  InventoryRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<void> recordInbound({
    required String productId,
    required num qty,
    required String operatorId,
    String? batchNo,
    DateTime? expireDate,
    String? note,
  }) =>
      db.inventoryDao.recordInbound(
        productId: productId,
        qty: qty,
        operatorId: operatorId,
        batchNo: batchNo,
        expireDate: expireDate,
        note: note,
      );

  @override
  Future<void> recordOutbound({
    required String productId,
    required num qty,
    required OutboundReason reason,
    required String operatorId,
    String? note,
  }) =>
      db.inventoryDao.recordOutbound(
        productId: productId,
        qty: qty,
        reason: reason,
        operatorId: operatorId,
        note: note,
      );

  @override
  Future<num> currentStock(String productId) =>
      db.inventoryDao.currentStock(productId);

  @override
  Future<List<StockView>> expiringSoon(int days) =>
      db.inventoryDao.expiringSoon(days);

  @override
  Future<List<StockView>> lowStock() => db.inventoryDao.lowStock();

  @override
  Stream<List<ProductModel>> watchProducts() => db.inventoryDao.watchProducts();

  @override
  Future<List<ProductModel>> getProducts() => db.inventoryDao.getAllProducts();

  @override
  Future<ProductModel?> getProduct(String id) => db.inventoryDao.getProduct(id);

  @override
  Future<void> saveProduct(ProductModel product) =>
      db.inventoryDao.saveProduct(product);

  @override
  Future<void> deleteProduct(String id) =>
      db.inventoryDao.softDeleteProduct(id);

  @override
  Stream<List<CategoryModel>> watchCategories() =>
      db.inventoryDao.watchCategories();

  @override
  Future<List<CategoryModel>> getCategories() => db.inventoryDao.getAllCategories();

  @override
  Future<void> saveCategory(CategoryModel category) =>
      db.inventoryDao.saveCategory(category);
}
