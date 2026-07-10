/// ProductRepository（system_design §3.3）。
import '../../models/category.dart';
import '../../models/product.dart';
import '../local_db/app_database.dart';

/// 商品 / 分类仓储接口。
abstract class ProductRepository {
  /// 获取全部商品。
  Future<List<Product>> getProducts();

  /// 监听全部商品。
  Stream<List<Product>> watchProducts();

  /// 按 id 获取商品。
  Future<Product?> getProduct(String id);

  /// 保存商品（upsert）。
  Future<void> saveProduct(Product product);

  /// 软删商品。
  Future<void> deleteProduct(String id);

  /// 获取全部分类。
  Future<List<Category>> getCategories();

  /// 监听全部分类。
  Stream<List<Category>> watchCategories();

  /// 保存分类（upsert）。
  Future<void> saveCategory(Category category);
}

/// 基于 Drift 的实现（商品 / 分类存于 InventoryDao）。
class ProductRepositoryImpl implements ProductRepository {
  /// 构造。
  ProductRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<List<Product>> getProducts() => db.inventoryDao.getAllProducts();

  @override
  Stream<List<Product>> watchProducts() => db.inventoryDao.watchProducts();

  @override
  Future<Product?> getProduct(String id) => db.inventoryDao.getProduct(id);

  @override
  Future<void> saveProduct(Product product) =>
      db.inventoryDao.saveProduct(product);

  @override
  Future<void> deleteProduct(String id) =>
      db.inventoryDao.softDeleteProduct(id);

  @override
  Future<List<Category>> getCategories() => db.inventoryDao.getAllCategories();

  @override
  Stream<List<Category>> watchCategories() =>
      db.inventoryDao.watchCategories();

  @override
  Future<void> saveCategory(Category category) =>
      db.inventoryDao.saveCategory(category);
}
