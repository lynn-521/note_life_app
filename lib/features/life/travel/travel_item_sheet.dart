/// 旅游清单项编辑弹层（行李 / 预算）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/enums.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_item.dart';
import '../../../features/shared/app_button.dart';
import '../../../features/shared/avatar_dot.dart';
import '../../../features/shared/toast.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';

/// 旅游清单项编辑弹层。
class TravelItemSheet extends ConsumerStatefulWidget {
  /// 构造。
  const TravelItemSheet({
    super.key,
    required this.planId,
    required this.type,
    this.item,
  });

  /// 所属计划书。
  final String planId;

  /// 类型（行李 / 预算）。
  final TravelItemType type;

  /// 编辑对象（null 新建）。
  final TravelItemModel? item;

  @override
  ConsumerState<TravelItemSheet> createState() => _TravelItemSheetState();
}

class _TravelItemSheetState extends ConsumerState<TravelItemSheet> {
  late final TextEditingController _name;
  late final TextEditingController _qty;
  late final TextEditingController _amount;
  String? _assignedTo;

  @override
  void initState() {
    super.initState();
    final i = widget.item;
    _name = TextEditingController(text: i?.name ?? '');
    _qty = TextEditingController(text: i?.qty?.toString() ?? '');
    _amount = TextEditingController(text: i?.amount?.toString() ?? '');
    _assignedTo = i?.assignedTo;
  }

  @override
  void dispose() {
    _name.dispose();
    _qty.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final members = ref.watch(membersProvider).valueOrNull ?? const <MemberModel>[];
    final isBudget = widget.type == TravelItemType.budget;
    final isEdit = widget.item != null;
    return Container(
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(theme.radiusModal)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.borderStrong,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(isEdit ? '编辑${isBudget ? "预算" : "行李"}'
                : '添加${isBudget ? "预算" : "行李"}',
                style: AppTextStyles.display(20, weight: FontWeight.w700)),
            const SizedBox(height: 16),
            _field(theme, '名称', _name,
                isBudget ? '如：交通' : '如：防晒霜'),
            const SizedBox(height: 12),
            if (isBudget)
              _field(theme, '金额（元）', _amount, '0',
                  keyboard: TextInputType.number)
            else
              _field(theme, '数量', _qty, '0',
                  keyboard: TextInputType.number),
            const SizedBox(height: 16),
            Text('认领人（可选）',
                style: AppTextStyles.sans(14, weight: FontWeight.w700)
                    .copyWith(color: theme.textSecondary)),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _memberChip(theme, null, '未认领', members),
                  const SizedBox(width: 10),
                  ...members.map(
                    (m) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _memberChip(theme, m.id, m.name, members),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppButton(label: '保存', block: true, onPressed: _save),
          ],
        ),
      ),
    );
  }

  Widget _field(AppTheme theme, String label, TextEditingController c,
      String hint, {TextInputType? keyboard}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.sans(14, weight: FontWeight.w700)
                .copyWith(color: theme.textSecondary)),
        const SizedBox(height: 8),
        TextField(
          controller: c,
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: theme.surface2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.radiusInput),
              borderSide: BorderSide.none,
            ),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _memberChip(AppTheme theme, String? id, String name,
      List<MemberModel> members) {
    final selected = _assignedTo == id;
    final color = id == null
        ? theme.textTertiary
        : Color(members.firstWhere((m) => m.id == id).color);
    return GestureDetector(
      onTap: () => setState(() => _assignedTo = id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? theme.primarySoft : theme.surface2,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? theme.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (id != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: AvatarDot(
                    color: color,
                    label: name.isNotEmpty ? name[0] : '?',
                    size: 20),
              ),
            Text(name,
                style: AppTextStyles.sans(13, weight: FontWeight.w700)
                    .copyWith(
                  color: selected ? theme.primaryInk : theme.textSecondary,
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final name = _name.text.trim();
    if (name.isEmpty) {
      showAppToast(context, '请填写名称');
      return;
    }
    final isBudget = widget.type == TravelItemType.budget;
    final qty = isBudget ? null : num.tryParse(_qty.text);
    final amount = isBudget ? num.tryParse(_amount.text) : null;
    final item = TravelItemModel(
      id: widget.item?.id ?? IdGenerator.newId(IdPrefix.item),
      planId: widget.planId,
      type: widget.type,
      name: name,
      qty: qty,
      amount: amount,
      done: widget.item?.done ?? false,
      assignedTo: _assignedTo,
      createdAt: widget.item?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
      version: widget.item?.version ?? 1,
      deletedAt: widget.item?.deletedAt,
    );
    await ref.read(travelNotifier.notifier).saveItem(item);
    if (mounted) {
      showAppToast(context, '已保存 ✅');
      Navigator.of(context).pop();
    }
  }
}
