/// 撒花动效（DESIGN.md §9 服药打卡完成 confetti）。尊重 reduce-motion，克制触发。
import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/theme/app_theme_extension.dart';

/// 触发一次撒花（仅在用药成功时调用）。reduce-motion 下静默跳过。
void fireConfetti(BuildContext context) {
  final reduce = MediaQuery.of(context).disableAnimations;
  if (reduce) return;
  final overlay = Overlay.of(context);
  if (overlay == null) return;
  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => _ConfettiBurst(onDone: () => entry.remove()),
  );
  overlay.insert(entry);
}

class _Piece {
  _Piece({
    required this.dx,
    required this.color,
    required this.delay,
    required this.width,
    required this.height,
  });

  final double dx;
  final Color color;
  final double delay;
  final double width;
  final double height;
}

class _ConfettiBurst extends StatefulWidget {
  const _ConfettiBurst({required this.onDone});
  final VoidCallback onDone;

  @override
  State<_ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<_ConfettiBurst>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Piece> _pieces = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    final theme = AppTheme.of(context);
    final colors = [
      theme.primary,
      theme.secondary,
      theme.sun,
      theme.sky,
      theme.berry,
    ];
    for (var i = 0; i < 18; i++) {
      _pieces.add(
        _Piece(
          dx: (_random.nextDouble() * 180) - 90, // -90..90
          color: colors[_random.nextInt(colors.length)],
          delay: _random.nextDouble() * 0.2,
          width: 6 + _random.nextDouble() * 5,
          height: 9 + _random.nextDouble() * 6,
        ),
      );
    }
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onDone();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final centerX = size.width / 2;
    final startY = size.height * 0.35;
    return IgnorePointer(
      child: Stack(
        children: _pieces.map((p) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              final t = (_controller.value - p.delay).clamp(0.0, 1.0);
              final y = startY + t * 260;
              final x = centerX + p.dx + sin(t * 6) * 12;
              return Positioned(
                left: x,
                top: y,
                child: Opacity(
                  opacity: (1 - t).clamp(0.0, 1.0),
                  child: Transform.rotate(
                    angle: t * 6,
                    child: Container(
                      width: p.width,
                      height: p.height,
                      decoration: BoxDecoration(
                        color: p.color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
