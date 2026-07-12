/// ProductRepository（system_design §3.3）。
library;
import '../models/category.dart';
import '../models/product.dart';
import '../local_db/app_database.dart';

/// 商品 / 分类仓储接口。
abstract class ProductRepository {
  /// 获取全部商品。
  Future<List<ProductModel>> getProducts();

  /// 监听全部商品。
  Stream<List<ProductModel>> watchProducts();

  /// 按 id 获取商品。
  Future<ProductModel?> getProduct(String id);

  /// 按条形码查找唯一未软删商品（扫码入库用）。
  ///
  /// 返回 `null` 时表示该条码在商品库内尚未登记，应引导用户先新增。
  Future<ProductModel?> getByBarcode(String barcode);

  /// 保存商品（upsert）。
  Future<void> saveProduct(ProductModel product);

  /// 软删商品。
  Future<void> deleteProduct(String id);

  /// 获取全部分类。
  Future<List<CategoryModel>> getCategories();

  /// 监听全部分类。
  Stream<List<CategoryModel>> watchCategories();

  /// 保存分类（upsert）。
  Future<void> saveCategory(CategoryModel category);
}

/// 基于 Drift 的实现（商品 / 分类存于 InventoryDao）。
class ProductRepositoryImpl implements ProductRepository {
  /// 构造。
  ProductRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<List<ProductModel>> getProducts() => db.inventoryDao.getAllProducts();

  @override
  Stream<List<ProductModel>> watchProducts() => db.inventoryDao.watchProducts();

  @override
  Future<ProductModel?> getProduct(String id) => db.inventoryDao.getProduct(id);

  @override
  Future<ProductModel?> getByBarcode(String barcode) =>
      db.inventoryDao.getProductByBarcode(barcode);

  @override
  Future<void> saveProduct(ProductModel product) =>
      db.inventoryDao.saveProduct(product);

  @override
  Future<void> deleteProduct(String id) =>
      db.inventoryDao.softDeleteProduct(id);

  @override
  Future<List<CategoryModel>> getCategories() => db.inventoryDao.getAllCategories();

  @override
  Stream<List<CategoryModel>> watchCategories() =>
      db.inventoryDao.watchCategories();

  @override
  Future<void> saveCategory(CategoryModel category) =>
      db.inventoryDao.saveCategory(category);
}
