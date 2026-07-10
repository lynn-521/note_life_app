/// 入库表单（手动录入 + 扫码占位）。
///
/// system_design §T05：入库（手动 + 扫码占位）。事件溯源：写 InboundOrder + StockBatch。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/product.dart';
import '../../../providers/app_providers.dart';
import '../../shared/app_button.dart';
import '../../shared/app_card.dart';
import '../../shared/app_chip.dart';
import '../../shared/screen_header.dart';
import '../../shared/toast.dart';
import '../providers/inventory_providers.dart';

/// 入库表单页（手动 + 扫码占位）。
class InboundFormView extends ConsumerStatefulWidget {
  /// 构造。
  const InboundFormView({super.key});

  @override
  ConsumerState<InboundFormView> createState() => _InboundFormViewState();
}

class _InboundFormViewState extends ConsumerState<InboundFormView> {
  Product? _product;
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
                              Text('摄像头权限对接中（P1）',
                                  style: AppTextStyles.sans(12,
                                      color: theme.textSecondary)),
                            ],
                          ),
                        ),
                        AppButton(
                          kind: AppButtonKind.ghost,
                          label: '敬请期待',
                          small: true,
                          onPressed: () =>
                              showAppToast(context, '扫码功能将在 P1 上线'),
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
