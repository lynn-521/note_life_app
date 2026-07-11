/// 旅游计划书编辑弹层（标题 / 日期 / 参与成员）。
library;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/datetime_ext.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/member.dart';
import '../../../data/models/travel_plan.dart';
import '../../../features/shared/app_button.dart';
import '../../../features/shared/avatar_dot.dart';
import '../../../features/shared/toast.dart';
import '../../../providers/app_providers.dart';
import '../providers/life_providers.dart';

/// 旅游计划书编辑弹层。
class TravelFormSheet extends ConsumerStatefulWidget {
  /// 构造。
  const TravelFormSheet({super.key, this.plan});

  /// 编辑对象（null 新建）。
  final TravelPlanModel? plan;

  @override
  ConsumerState<TravelFormSheet> createState() => _TravelFormSheetState();
}

class _TravelFormSheetState extends ConsumerState<TravelFormSheet> {
  late final TextEditingController _title;
  DateTime? _start;
  DateTime? _end;
  List<String> _memberIds = const [];

  @override
  void initState() {
    super.initState();
    final p = widget.plan;
    _title = TextEditingController(text: p?.title ?? '');
    _start = p?.start;
    _end = p?.end;
    _memberIds = p?.memberIds.toList() ?? const [];
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final members = ref.watch(membersProvider).valueOrNull ?? const <MemberModel>[];
    final isEdit = widget.plan != null;
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
            Center(child: _handle(theme)),
            const SizedBox(height: 16),
            Text(isEdit ? '编辑旅行计划' : '新建旅行计划',
                style: AppTextStyles.display(20, weight: FontWeight.w700)),
            const SizedBox(height: 16),
            _label(theme, '标题'),
            const SizedBox(height: 8),
            _titleField(theme),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _dateButton(theme, '出发', _start,
                      () => _pick(context, true)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _dateButton(theme, '返回', _end,
                      () => _pick(context, false)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _label(theme, '参与成员'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: members
                  .map<Widget>((m) {
                    final selected = _memberIds.contains(m.id);
                    return GestureDetector(
                      onTap: () => setState(() {
                        if (selected) {
                          _memberIds =
                              _memberIds.where((id) => id != m.id).toList();
                        } else {
                          _memberIds = [..._memberIds, m.id];
                        }
                      }),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selected
                                    ? theme.primary
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: AvatarDot(
                              color: Color(m.color),
                              label: m.name.isNotEmpty ? m.name[0] : '?',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(m.name,
                              style: AppTextStyles.sans(12,
                                      weight: FontWeight.w700)
                                  .copyWith(
                                color: selected
                                    ? theme.primaryInk
                                    : theme.textTertiary,
                              )),
                        ],
                      ),
                    );
                  })
                  .toList()
                ..add(const SizedBox(width: 4)),
            ),
            const SizedBox(height: 20),
            AppButton(label: '保存', block: true, onPressed: _save),
            if (isEdit) ...[
              const SizedBox(height: 10),
              AppButton(
                kind: AppButtonKind.ghost,
                label: '删除计划',
                block: true,
                onPressed: _delete,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _handle(AppTheme theme) => Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: theme.borderStrong,
          borderRadius: BorderRadius.circular(999),
        ),
      );

  Widget _label(AppTheme theme, String text) => Text(text,
      style: AppTextStyles.sans(14, weight: FontWeight.w700)
          .copyWith(color: theme.textSecondary));

  Widget _titleField(AppTheme theme) => TextField(
        controller: _title,
        decoration: InputDecoration(
          hintText: '如：暑假海边游',
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
      );

  Widget _dateButton(AppTheme theme, String label, DateTime? value,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: theme.surface2,
          borderRadius: BorderRadius.circular(theme.radiusInput),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: AppTextStyles.sans(12, weight: FontWeight.w700)
                    .copyWith(color: theme.textTertiary)),
            const SizedBox(height: 4),
            Text(
              value == null ? '选择日期' : value.zhLong,
              style: AppTextStyles.sans(13)
                  .copyWith(color: theme.textPrimary),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pick(BuildContext context, bool isStart) async {
    final current = isStart ? _start : _end;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _start = picked;
        } else {
          _end = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) {
      showAppToast(context, '请填写标题');
      return;
    }
    if (_start == null || _end == null) {
      showAppToast(context, '请选择出发与返回日期');
      return;
    }
    final plan = TravelPlanModel(
      id: widget.plan?.id ?? IdGenerator.newId(IdPrefix.travel),
      title: title,
      start: _start!,
      end: _end!,
      memberIds: _memberIds,
      createdAt: widget.plan?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await ref.read(travelNotifier.notifier).savePlan(plan);
    if (mounted) {
      showAppToast(context, '已保存 ✅');
      Navigator.of(context).pop();
    }
  }

  Future<void> _delete() async {
    final id = widget.plan?.id;
    if (id == null) return;
    await ref.read(travelNotifier.notifier).deletePlan(id);
    if (mounted) {
      showAppToast(context, '已删除');
      Navigator.of(context).pop();
    }
  }
}
