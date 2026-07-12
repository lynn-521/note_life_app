/// 拍照入库 · 人工确认页（核心交互）。
///
/// 流程：
/// 1. 顶部 "全部提交" 按钮（disabled until 至少 1 个已确认）
/// 2. 中间：图片（[Image.file]）+ 叠加层 [CustomPaint] 画每个 [DetectItem] 的
///    bbox + 角标显示序号 + label
/// 3. 点 bbox → 底部弹 sheet：
///    - 顶部"识别结果：[label]" + 置信度
///    - 候选商品列表（已有 Product 按 categoryHint 过滤 + 模糊匹配 label）
///    - "+ 新增商品"入口 → 弹 dialog（沿用 [inbound_form_view] 同样模式）
///    - 数量 input（默认 1）
///    - "确定"按钮 → 写入本地的 `confirmed: Map<detectionId, (product, qty)>`
/// 4. 顶部"全部提交"按钮按下后：循环 `recordInbound` 多次
///
/// 测试要点（photo_review_widget_test.dart）：
/// - mock 一个 3 个 detection 的 [DetectResult]
/// - 验证 3 个 bbox 渲染
/// - tap 1 个 bbox 弹 sheet
/// - 候选列表含相关 Product
library;
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/category.dart';
import '../../../data/models/detect_result.dart';
import '../../../data/models/product.dart';
import '../../../providers/app_providers.dart';
import '../../shared/app_button.dart';
import '../../shared/app_card.dart';
import '../../shared/app_chip.dart';
import '../../shared/screen_header.dart';
import '../../shared/toast.dart';
import '../providers/inventory_providers.dart';

/// 用户对一个 detection 的确认结果。
class _ConfirmedPick {
  /// 构造。
  const _ConfirmedPick({
    required this.product,
    required this.qty,
    this.expireDate,
  });

  /// 选定的商品。
  final ProductModel product;

  /// 数量。
  final num qty;

  /// 过期日期（可选）。
  final DateTime? expireDate;
}

class PhotoReviewPage extends ConsumerStatefulWidget {
  /// 构造。
  const PhotoReviewPage({
    super.key,
    required this.imageFile,
    required this.detectResult,
    this.imageSize,
  });

  /// 待审核的图片文件（拍照 / 相册选）。
  final File imageFile;

  /// 后端 /inbound/detect 返回的检测结果。
  final DetectResult detectResult;

  /// 已知图片尺寸（测试用；为 null 时走 [ImageStream] 解析）。
  final Size? imageSize;

  @override
  ConsumerState<PhotoReviewPage> createState() => _PhotoReviewPageState();
}

class _PhotoReviewPageState extends ConsumerState<PhotoReviewPage> {
  /// 图片实际尺寸（异步加载解析）。
  Size? _imageSize;

  /// 用户确认的 mapping：detectionId → _ConfirmedPick。
  final Map<String, _ConfirmedPick> _confirmed = {};

  /// "全部提交"进行中。
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.imageSize != null) {
      _imageSize = widget.imageSize;
    } else {
      _resolveImageSize();
    }
  }

  /// 解析图片实际宽高（用于把 bbox 相对坐标反算为屏幕像素）。
  ///
  /// 加 1.5s 超时兜底：避免测试 / 极慢设备上 image stream 永远不回调导致
  /// 全页卡在 spinner。
  void _resolveImageSize() {
    final img = Image.file(widget.imageFile);
    final stream = img.image.resolve(const ImageConfiguration());
    late final ImageStreamListener listener;
    bool settled = false;
    void settle(Size size) {
      if (settled || !mounted) return;
      settled = true;
      setState(() => _imageSize = size);
      stream.removeListener(listener);
    }

    listener = ImageStreamListener(
      (info, _) => settle(Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      )),
      onError: (_, __) => settle(const Size(1, 1)),
    );
    stream.addListener(listener);
    // 兜底超时
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      if (!settled) settle(const Size(1, 1));
    });
  }

  // ──────────────────── 交互：点 bbox 弹 sheet ────────────────────

  Future<void> _openSheetFor(DetectItem det) async {
    final picked = await showModalBottomSheet<_ConfirmedPick>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _ConfirmSheet(
        detection: det,
        existingConfirmed: _confirmed[det.id],
      ),
    );
    if (picked == null || !mounted) return;
    setState(() => _confirmed[det.id] = picked);
  }

  // ──────────────────── 交互：全部提交 ────────────────────

  Future<void> _submitAll() async {
    if (_confirmed.isEmpty) {
      showAppToast(context, '请先点击图片上的商品框完成确认');
      return;
    }
    setState(() => _submitting = true);
    final repos = ref.read(repositoriesProvider);
    final members = await repos.member.getAll();
    final operatorId = members.isNotEmpty ? members.first.id : 'unknown';
    final picks = _confirmed.values.toList();
    int success = 0;
    final failed = <String>[];
    for (final p in picks) {
      try {
        await repos.inventory.recordInbound(
          productId: p.product.id,
          qty: p.qty,
          operatorId: operatorId,
          expireDate: p.expireDate,
        );
        success += 1;
      } catch (e) {
        failed.add('${p.product.name}: $e');
      }
    }
    if (!mounted) return;
    if (failed.isNotEmpty) {
      showAppToast(context, '已入库 $success 个，${failed.length} 个失败');
    } else {
      showAppToast(context, '已入库 $success 个商品 ✅');
    }
    setState(() => _submitting = false);
    // 全部成功 → pop 回入库列表（保持已确认状态清空）
    if (failed.isEmpty) {
      Navigator.of(context).pop();
    }
  }

  // ──────────────────── 辅助：候选商品过滤 ────────────────────

  // 注：_candidatesFor 实际只在 _ConfirmSheet 中使用，故移到那里避免重复。

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final productsAsync = ref.watch(productsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: '🖼️ 拍照入库 · 确认',
              actionIcon: _submitting ? null : '✅',
              onAction: _submitting ? null : _submitAll,
            ),
            if (_imageSize == null)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildImageWithBboxes(theme),
                      const SizedBox(height: 12),
                      _buildHint(theme),
                      const SizedBox(height: 12),
                      productsAsync.when(
                        data: (products) {
                          final categories = categoriesAsync.valueOrNull ??
                              <CategoryModel>[];
                          return _buildDetectionList(
                              theme, products, categories);
                        },
                        loading: () => const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        error: (e, _) => Text('加载商品失败：$e',
                            style: TextStyle(color: theme.danger)),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithBboxes(AppTheme theme) {
    final w = _imageSize!.width;
    final h = _imageSize!.height;
    return LayoutBuilder(
      builder: (ctx, c) {
        // 图片按宽度铺满，高度按真实宽高比
        final displayW = c.maxWidth;
        final displayH = displayW * (h / w);
        return Container(
          width: displayW,
          height: displayH,
          decoration: BoxDecoration(
            color: theme.surface2,
            borderRadius: BorderRadius.circular(theme.radiusCard),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              // 原图
              Positioned.fill(
                child: Image.file(widget.imageFile, fit: BoxFit.cover),
              ),
              // bbox 叠加 + 画框 + tap
              for (final det in widget.detectResult.detections)
                _buildBboxTap(det, displayW, displayH, theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBboxTap(
    DetectItem det,
    double displayW,
    double displayH,
    AppTheme theme,
  ) {
    final left = det.bbox.x * displayW;
    final top = det.bbox.y * displayH;
    final w = det.bbox.w * displayW;
    final h = det.bbox.h * displayH;
    final isConfirmed = _confirmed.containsKey(det.id);
    return Positioned(
      left: left,
      top: top,
      width: w,
      height: h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _openSheetFor(det),
          child: CustomPaint(
            painter: _BboxPainter(
              color: isConfirmed ? theme.success : theme.primary,
              label: det.label,
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }

  Widget _buildHint(AppTheme theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.surface2,
        borderRadius: BorderRadius.circular(theme.radiusInput),
      ),
      child: Text(
        '点击图片中的彩色框选择商品；已确认 ${_confirmed.length} / ${widget.detectResult.detections.length}',
        style: AppTextStyles.sans(12, color: theme.textSecondary),
      ),
    );
  }

  Widget _buildDetectionList(
    AppTheme theme,
    List<ProductModel> products,
    List<CategoryModel> categories,
  ) {
    final dets = widget.detectResult.detections;
    if (dets.isEmpty) {
      return AppCard(
        child: Text('后端未识别出任何商品',
            style: AppTextStyles.sans(13, color: theme.textSecondary)),
      );
    }
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('识别候选（${dets.length}）',
              style: AppTextStyles.sans(14, weight: FontWeight.w700)
                  .copyWith(color: theme.textSecondary)),
          const SizedBox(height: 10),
          for (var i = 0; i < dets.length; i++) ...[
            _DetectionTile(
              index: i + 1,
              detection: dets[i],
              confirmed: _confirmed[dets[i].id],
              onTap: () => _openSheetFor(dets[i]),
            ),
            if (i < dets.length - 1) const Divider(height: 18),
          ],
        ],
      ),
    );
  }
}

// ──────────────────── Bbox 画框 + 标签角标 ────────────────────

class _BboxPainter extends CustomPainter {
  _BboxPainter({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    final r = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(6),
    );
    canvas.drawRRect(r, stroke);

    // 顶角小三角
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(16, 0)
      ..lineTo(0, 16)
      ..close();
    final fill = Paint()..color = color;
    canvas.drawPath(path, fill);
  }

  @override
  bool shouldRepaint(covariant _BboxPainter old) =>
      old.color != color || old.label != label;
}

// ──────────────────── 列表单行：序号 + label + 置信度 + 状态 ────────────────────

class _DetectionTile extends StatelessWidget {
  const _DetectionTile({
    required this.index,
    required this.detection,
    required this.confirmed,
    required this.onTap,
  });

  final int index;
  final DetectItem detection;
  final _ConfirmedPick? confirmed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final ok = confirmed != null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: ok ? theme.successSoft : theme.primarySoft,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text('$index',
                  style: AppTextStyles.sans(13, weight: FontWeight.w700)
                      .copyWith(color: ok ? theme.successInk : theme.primaryInk)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detection.label,
                      style: AppTextStyles.sans(15, weight: FontWeight.w700)
                          .copyWith(color: theme.textPrimary)),
                  const SizedBox(height: 2),
                  Text(
                    ok
                        ? '已确认：${confirmed!.product.name} × ${confirmed!.qty}'
                        : '置信度 ${(detection.confidence * 100).toStringAsFixed(0)}% · ${detection.categoryHint}',
                    style: AppTextStyles.sans(12, color: theme.textSecondary),
                  ),
                ],
              ),
            ),
            Icon(
              ok ? Icons.check_circle : Icons.chevron_right,
              color: ok ? theme.success : theme.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────── 底部 sheet：选商品 + 数量 + 新增 ────────────────────

class _ConfirmSheet extends ConsumerStatefulWidget {
  const _ConfirmSheet({
    required this.detection,
    this.existingConfirmed,
  });

  final DetectItem detection;
  final _ConfirmedPick? existingConfirmed;

  @override
  ConsumerState<_ConfirmSheet> createState() => _ConfirmSheetState();
}

class _ConfirmSheetState extends ConsumerState<_ConfirmSheet> {
  ProductModel? _selected;
  late final TextEditingController _qtyController;
  DateTime? _expireDate;

  @override
  void initState() {
    super.initState();
    _selected = widget.existingConfirmed?.product;
    _qtyController = TextEditingController(
      text: widget.existingConfirmed?.qty.toString() ?? '1',
    );
    _expireDate = widget.existingConfirmed?.expireDate;
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  Future<void> _pickExpire() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expireDate ?? DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null && mounted) {
      setState(() => _expireDate = picked);
    }
  }

  Future<void> _newProduct() async {
    final categories = await ref.read(repositoriesProvider).product.getCategories();
    if (!mounted) return;
    final created = await showDialog<ProductModel>(
      context: context,
      builder: (ctx) => _NewProductDialog(
        initialName: widget.detection.label,
        categoryHint: widget.detection.categoryHint,
        categories: categories,
      ),
    );
    if (created == null || !mounted) return;
    await ref.read(repositoriesProvider).product.saveProduct(created);
    if (!mounted) return;
    setState(() => _selected = created);
  }

  void _submit() {
    if (_selected == null) {
      showAppToast(context, '请先选择商品');
      return;
    }
    final qty = num.tryParse(_qtyController.text);
    if (qty == null || qty <= 0) {
      showAppToast(context, '数量不正确');
      return;
    }
    Navigator.of(context).pop(
      _ConfirmedPick(
        product: _selected!,
        qty: qty,
        expireDate: _expireDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final products = ref.watch(productsProvider).valueOrNull ?? const [];
    final categories =
        ref.watch(categoriesProvider).valueOrNull ?? const [];
    final candidates = _filterCandidates(
      widget.detection,
      products,
      categories,
    );
    final mq = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: theme.bg,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(theme.radiusModal),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text('识别结果：${widget.detection.label}',
                    style: AppTextStyles.display(18, weight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(
                  '置信度 ${(widget.detection.confidence * 100).toStringAsFixed(0)}% · ${widget.detection.categoryHint}',
                  style:
                      AppTextStyles.sans(12, color: theme.textSecondary),
                ),
                const SizedBox(height: 16),
                Text('候选商品',
                    style: AppTextStyles.sans(14, weight: FontWeight.w700)
                        .copyWith(color: theme.textSecondary)),
                const SizedBox(height: 8),
                if (candidates.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('暂无匹配商品，请新增',
                        style: AppTextStyles.sans(13,
                            color: theme.textSecondary)),
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: candidates.map((p) {
                      return AppChip(
                        label: p.name,
                        selected: _selected?.id == p.id,
                        onTap: () => setState(() => _selected = p),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 8),
                AppButton(
                  label: '+ 新增商品',
                  kind: AppButtonKind.secondary,
                  small: true,
                  onPressed: _newProduct,
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 10),
                InkWell(
                  onTap: _pickExpire,
                  borderRadius:
                      BorderRadius.circular(theme.radiusInput),
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
                const SizedBox(height: 16),
                AppButton(
                  label: '确定',
                  block: true,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ProductModel> _filterCandidates(
    DetectItem det,
    List<ProductModel> all,
    List<CategoryModel> categories,
  ) {
    final cat = categories.where((c) => c.kind.name == det.categoryHint).toList();
    final catIds = cat.map((c) => c.id).toSet();
    final sameKind = all.where((p) => catIds.contains(p.categoryId)).toList();
    final label = det.label.toLowerCase();
    bool nameHit(ProductModel p) => p.name.toLowerCase().contains(label);
    final hits = sameKind.where(nameHit).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    if (hits.isNotEmpty) return hits;
    final rest = sameKind.where((p) => !nameHit(p)).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    if (rest.isNotEmpty) return rest;
    final fallback = List<ProductModel>.from(all)
      ..sort((a, b) => a.name.compareTo(b.name));
    return fallback.take(20).toList();
  }
}

// ──────────────────── "新增商品" dialog（沿用 inbound_form_view 模式）────────────────────

class _NewProductDialog extends StatefulWidget {
  const _NewProductDialog({
    required this.initialName,
    required this.categoryHint,
    required this.categories,
  });

  final String initialName;
  final String categoryHint;
  final List<CategoryModel> categories;

  @override
  State<_NewProductDialog> createState() => _NewProductDialogState();
}

class _NewProductDialogState extends State<_NewProductDialog> {
  late final TextEditingController _nameController;
  final _unitController = TextEditingController(text: '件');
  String? _categoryId;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    // 默认选第一个匹配 hint 的分类；否则取第一个分类
    final matched = widget.categories
        .where((c) => c.kind.name == widget.categoryHint)
        .toList();
    if (matched.isNotEmpty) {
      _categoryId = matched.first.id;
    } else if (widget.categories.isNotEmpty) {
      _categoryId = widget.categories.first.id;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _unitController.dispose();
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
                        child: Text('${c.name} (${c.kind.name})'),
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
