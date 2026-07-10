/// 备忘录编辑弹层（增 / 改 / 删 / 置顶 / 完成 / 到期）。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/memo.dart';
import '../../../features/shared/app_button.dart';
import '../../../features/shared/app_card.dart';
import '../../../features/shared/app_switch.dart';
import '../../../features/shared/toast.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';

/// 备忘编辑弹层。
class MemoFormSheet extends ConsumerStatefulWidget {
  /// 构造。
  const MemoFormSheet({super.key, this.memo});

  /// 编辑对象（null 表示新建）。
  final Memo? memo;

  @override
  ConsumerState<MemoFormSheet> createState() => _MemoFormSheetState();
}

class _MemoFormSheetState extends ConsumerState<MemoFormSheet> {
  late final TextEditingController _title;
  late final TextEditingController _body;
  late bool _pinned;
  late bool _done;
  DateTime? _due;

  @override
  void initState() {
    super.initState();
    final m = widget.memo;
    _title = TextEditingController(text: m?.title ?? '');
    _body = TextEditingController(text: m?.body ?? '');
    _pinned = m?.pinned ?? false;
    _done = m?.done ?? false;
    _due = m?.dueAt;
  }

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final isEdit = widget.memo != null;
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
            Text(isEdit ? '编辑备忘' : '新建备忘',
                style: AppTextStyles.display(20, weight: FontWeight.w700)),
            const SizedBox(height: 16),
            _field('标题', _title, '想记点什么？'),
            const SizedBox(height: 12),
            _field('内容', _body, '补充说明（可选）', maxLines: 3),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: _pickDue,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: theme.surface2,
                  borderRadius: BorderRadius.circular(theme.radiusInput),
                ),
                child: Text(
                  _due == null ? '设置到期日（可选）' : '到期：${_due!.zhLong}',
                  style: AppTextStyles.sans(14)
                      .copyWith(color: theme.textSecondary),
                ),
              ),
            ),
            if (_due != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => setState(() => _due = null),
                  child: const Text('清除到期日'),
                ),
              ),
            const SizedBox(height: 8),
            _switchRow('置顶', _pinned, (v) => setState(() => _pinned = v)),
            _switchRow('已完成', _done, (v) => setState(() => _done = v)),
            const SizedBox(height: 16),
            AppButton(label: '保存', block: true, onPressed: _save),
            if (isEdit) ...[
              const SizedBox(height: 10),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '删除',
                block: true,
                onPressed: _delete,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController c, String hint,
      {int maxLines = 1}) {
    final t = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.sans(14, weight: FontWeight.w700)
                .copyWith(color: t.textSecondary)),
        const SizedBox(height: 8),
        TextField(
          controller: c,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: t.surface2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(t.radiusInput),
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

  Widget _switchRow(String label, bool value, ValueChanged<bool> onChanged) {
    final t = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label,
              style: AppTextStyles.sans(15, weight: FontWeight.w700)
                  .copyWith(color: t.textPrimary)),
          const Spacer(),
          AppSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Future<void> _pickDue() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _due ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null) setState(() => _due = picked);
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) {
      showAppToast(context, '请填写标题');
      return;
    }
    final now = DateTime.now();
    final members = await ref.read(repositoriesProvider).member.getAll();
    final authorId = widget.memo?.authorId ??
        (members.isNotEmpty ? members.first.id : 'unknown');
    final memo = Memo(
      id: widget.memo?.id ?? IdGenerator.newId(IdPrefix.memo),
      title: title,
      body: _body.text.trim(),
      authorId: authorId,
      pinned: _pinned,
      done: _done,
      dueAt: _due,
      createdAt: widget.memo?.createdAt ?? now,
      updatedAt: now,
    );
    await ref.read(memoNotifier.notifier).save(memo);
    if (mounted) {
      showAppToast(context, '已保存 ✅');
      Navigator.of(context).pop();
    }
  }

  Future<void> _delete() async {
    final id = widget.memo?.id;
    if (id == null) return;
    await ref.read(memoNotifier.notifier).delete(id);
    if (mounted) {
      showAppToast(context, '已删除');
      Navigator.of(context).pop();
    }
  }
}
