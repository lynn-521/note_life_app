/// 入库表单（手动录入 + 扫码入库）。
///
/// system_design §T05：入库（手动 + 扫码）。事件溯源：写 InboundOrderModel + StockBatchModel。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/category.dart';
import '../../../data/models/product.dart';
import '../../../providers/app_providers.dart';
import '../../shared/app_button.dart';
import '../../shared/app_card.dart';
import '../../shared/app_chip.dart';
import '../../shared/screen_header.dart';
import '../../shared/toast.dart';
import '../providers/inventory_providers.dart';
import '../scan/barcode_scanner_page.dart';

/// 入库表单页（手动 + 扫码）。
class InboundFormView extends ConsumerStatefulWidget {
  /// 构造。
  const InboundFormView({super.key});

  @override
  ConsumerState<InboundFormView> createState() => _InboundFormViewState();
}

class _InboundFormViewState extends ConsumerState<InboundFormView> {
  ProductModel? _product;
  final TextEditingController _qtyController = TextEditingController(text: '1');
  final TextEditingController _noteController = TextEditingController();
  DateTime? _expireDate;

  @override
  void dispose() {
    _qtyController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickExpire() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expireDate ?? DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null) setState(() => _expireDate = picked);
  }

  Future<void> _submit() async {
    if (_product == null) {
      showAppToast(context, '请先选择商品');
      return;
    }
    final qty = num.tryParse(_qtyController.text);
    if (qty == null || qty <= 0) {
      showAppToast(context, '数量不正确');
      return;
    }
    final members = await ref.read(repositoriesProvider).member.getAll();
    final operatorId = members.isNotEmpty ? members.first.id : 'unknown';
    await ref.read(inboundFormNotifier.notifier).submit(
          productId: _product!.id,
          qty: qty,
          operatorId: operatorId,
          expireDate: _expireDate,
          note: _noteController.text.isEmpty ? null : _noteController.text,
        );
    if (mounted) {
      showAppToast(context, '已入库 ✅');
      context.pop();
    }
  }

  /// 打开扫码页 → 解析 barcode → 命中/未命中分别处理。
  Future<void> _openScanner() async {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerPage(),
        fullscreenDialog: true,
      ),
    );
    if (barcode == null || barcode.isEmpty || !mounted) return;
    await _handleScannedBarcode(barcode);
  }

  /// 扫码命中后的分流：找到商品 prefill / 没找到弹"新增" dialog。
  Future<void> _handleScannedBarcode(String barcode) async {
    final repo = ref.read(repositoriesProvider).product;
    final hit = await repo.getByBarcode(barcode);
    if (!mounted) return;
    if (hit != null) {
      // 命中：自动选中 + 数量默认 1（已默认 1，覆盖为 1 防呆）。
      setState(() {
        _product = hit;
        _qtyController.text = '1';
      });
      showAppToast(context, '找到商品：${hit.name}');
      return;
    }
    // 未命中：toast + 弹"新增商品" dialog（条码预填）。
    showAppToast(context, '未找到该条码商品，请手动新增');
    await _showNewProductDialog(barcode);
  }

  /// 弹"新增商品" dialog：名称/分类/单位/位置/条码 预填 barcode。
  Future<void> _showNewProductDialog(String barcode) async {
    final categories = await ref.read(repositoriesProvider).product.getCategories();
    if (!mounted) return;
    final created = await showDialog<ProductModel>(
      context: context,
      builder: (ctx) => _NewProductDialog(
        barcode: barcode,
        categories: categories,
      ),
    );
    if (created == null || !mounted) return;
    // 保存到仓储并自动选中 + 数量=1。
    await ref.read(repositoriesProvider).product.saveProduct(created);
    if (!mounted) return;
    setState(() {
      _product = created;
      _qtyController.text = '1';
    });
    showAppToast(context, '已新增商品：${created.name}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final products = ref.watch(productsProvider);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: '➕ 入库',
              actionIcon: '✅',
              onAction: _submit,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('选择商品',
                            style: AppTextStyles.sans(14, weight: FontWeight.w700)
                                .copyWith(color: theme.textSecondary)),
                        const SizedBox(height: 10),
                        products.when(
                          data: (list) => Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: list
                                .map(
                                  (p) => AppChip(
                                    label: p.name,
                                    selected: _product?.id == p.id,
                                    onTap: () => setState(() => _product = p),
                                  ),
                                )
                                .toList(),
                          ),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (e, __) => Text('加载失败: $e'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppCard(
                    child: Column(
                      children: [
                        TextField(
                          controller: _qtyController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: '数量',
                            filled: true,
                            fillColor: theme.surface2,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(theme.radiusInput),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: _pickExpire,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            decoration: BoxDecoration(
                              color: theme.surface2,
                              borderRadius:
                                  BorderRadius.circular(theme.radiusInput),
                            ),
                            child: Text(
                              _expireDate == null
                                  ? '选择过期日期（可选）'
                                  : '过期：${_expireDate!.zhLong}',
                              style: AppTextStyles.sans(14,
                                  color: theme.textSecondary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            labelText: '备注（可选）',
                            filled: true,
                            fillColor: theme.surface2,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(theme.radiusInput),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppCard(
                    onTap: _openScanner,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.skySoft,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                              child: Text('📷', style: TextStyle(fontSize: 20))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('扫码入库',
                                  style: AppTextStyles.sans(15,
                                          weight: FontWeight.w700)
                                      .copyWith(color: theme.textPrimary)),
                              Text('扫商品条形码自动匹配 / 未命中快速新增',
                                  style: AppTextStyles.sans(12,
                                      color: theme.textSecondary)),
                            ],
                          ),
                        ),
                        AppButton(
                          kind: AppButtonKind.ghost,
                          label: '打开扫码',
                          small: true,
                          onPressed: _openScanner,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                      label: '确认入库', block: true, onPressed: _submit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "扫码未命中 → 新增商品" dialog：商品名称 / 分类 / 单位 / 位置 / 条码 预填 barcode。
class _NewProductDialog extends StatefulWidget {
  /// 构造。
  const _NewProductDialog({
    required this.barcode,
    required this.categories,
  });

  /// 预填的条码。
  final String barcode;

  /// 已有分类列表。
  final List<CategoryModel> categories;

  @override
  State<_NewProductDialog> createState() => _NewProductDialogState();
}

class _NewProductDialogState extends State<_NewProductDialog> {
  final _nameController = TextEditingController();
  final _unitController = TextEditingController(text: '件');
  final _locationController = TextEditingController();
  String? _categoryId;

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      _categoryId = widget.categories.first.id;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _unitController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      showAppToast(context, '请输入商品名称');
      return;
    }
    final categoryId = _categoryId;
    if (categoryId == null) {
      showAppToast(context, '请先创建至少一个分类');
      return;
    }
    final unit = _unitController.text.trim();
    if (unit.isEmpty) {
      showAppToast(context, '请输入单位');
      return;
    }
    final at = DateTime.now();
    final product = ProductModel(
      id: IdGenerator.newId(IdPrefix.product),
      name: name,
      categoryId: categoryId,
      unit: unit,
      barcode: widget.barcode,
      location: _locationController.text.trim().isEmpty
          ? null
          : _locationController.text.trim(),
      createdAt: at,
      updatedAt: at,
    );
    Navigator.of(context).pop(product);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('新增商品'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: '商品名称 *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _categoryId,
              decoration: const InputDecoration(
                labelText: '分类 *',
                border: OutlineInputBorder(),
              ),
              items: widget.categories
                  .map((c) => DropdownMenuItem(
                        value: c.id,
                        child: Text(c.name),
                      ))
                  .toList(),
              onChanged: widget.categories.isEmpty
                  ? null
                  : (v) => setState(() => _categoryId = v),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _unitController,
              decoration: const InputDecoration(
                labelText: '单位 *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: '位置（可选）',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: TextEditingController(text: widget.barcode),
              readOnly: true,
              decoration: const InputDecoration(
                labelText: '条码（扫码预填）',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(onPressed: _submit, child: const Text('保存')),
      ],
    );
  }
}
