/// 全局 Toast（DESIGN.md §4 toast）。底部居中，自动消失，尊重 reduce-motion。
library;
import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';
import '../../core/theme/text_styles.dart';

/// 显示一条轻提示。基于 Overlay，1.6s 后消失。
void showAppToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => _ToastWidget(
      message: message,
      onDone: () => entry.remove(),
    ),
  );
  overlay.insert(entry);
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({required this.message, required this.onDone});
  final String message;
  final VoidCallback onDone;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    final reduce = MediaQuery.of(context).disableAnimations;
    if (reduce) {
      _visible = true;
    } else {
      Future.delayed(const Duration(milliseconds: 20), () {
        if (mounted) setState(() => _visible = true);
      });
    }
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) {
        setState(() => _visible = false);
        Future.delayed(const Duration(milliseconds: 240), widget.onDone);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final reduce = MediaQuery.of(context).disableAnimations;
    return Positioned(
      left: 0,
      right: 0,
      bottom: theme.tabBarHeight + 24,
      child: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: reduce ? Duration.zero : theme.durBase,
          curve: theme.easeOut,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: theme.textPrimary,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [theme.shadows.md],
            ),
            child: Text(
              widget.message,
              style: AppTextStyles.sans(14, weight: FontWeight.w700)
                  .copyWith(color: theme.textInverse),
            ),
          ),
        ),
      ),
    );
  }
}
