/// 条形码扫码页（mobile_scanner 5.x）。
///
/// 顶层 Scaffold + 全屏 [MobileScanner]：
/// - 顶部半透明提示"对準商品条形码"
/// - 右上角关闭按钮 → pop
/// - 检测到首个有效条码 → 立刻 [Navigator.pop] 回传 `rawValue` 字符串，
///   并停止相机避免重复回调。
///
/// 权限：构造时可注入 [permissionRequester] 以便在 widget test 中跳过
/// `permission_handler` 的平台通道；生产路径默认请求 CAMERA。
library;
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';

/// 扫码结果类型（= 条码 raw value 字符串；空串表示用户主动关闭但允许特殊值）。
typedef BarcodeScanResult = String;

/// 扫码页：弹起后进入全屏相机，扫到第一个有效 barcode 即 [Navigator.pop] 回传。
class BarcodeScannerPage extends StatefulWidget {
  /// 构造。
  const BarcodeScannerPage({super.key, this.permissionRequester});

  /// 权限请求回调。生产默认请求 CAMERA，测试可注入快速 no-op。
  final Future<bool> Function()? permissionRequester;

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  /// 相机控制器（在权限授予后 lazy 初始化）。
  MobileScannerController? _controller;

  /// 权限状态：`null` 表示尚未询问；`true` 已授予；`false` 被拒。
  bool? _granted;

  /// 是否已检测到条码（避免重复 pop / 多条回调覆盖）。
  bool _detected = false;

  @override
  void initState() {
    super.initState();
    // 权限请求放在 addPostFrameCallback 之后，避免在 build 中 await 平台通道。
    WidgetsBinding.instance.addPostFrameCallback((_) => _ensurePermission());
  }

  Future<void> _ensurePermission() async {
    final ok = await (widget.permissionRequester ?? _defaultRequest)();
    if (!mounted) return;
    setState(() {
      _granted = ok;
      if (ok) {
        _controller = MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          // 常见商品条码：EAN-13 / UPC-A / Code-128（已能覆盖 95% 场景）。
          formats: const [
            BarcodeFormat.ean13,
            BarcodeFormat.ean8,
            BarcodeFormat.upcA,
            BarcodeFormat.upcE,
            BarcodeFormat.code128,
            BarcodeFormat.code39,
            BarcodeFormat.qrCode,
          ],
        );
      }
    });
  }

  /// 默认权限请求：CAMERA 运行时权限（Android 13+ 必须运行时申请）。
  Future<bool> _defaultRequest() async {
    final status = await Permission.camera.request();
    if (status.isGranted || status.isLimited) return true;
    return false;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_detected) return;
    for (final b in capture.barcodes) {
      final v = b.rawValue;
      if (v != null && v.isNotEmpty) {
        _detected = true;
        _controller?.stop();
        Navigator.of(context).pop(v);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildCameraLayer(theme),
          // 顶部提示 + 右上角关闭按钮。
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '对準商品条形码',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.sans(14, weight: FontWeight.w700)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Material(
                      color: Colors.black.withValues(alpha: 0.45),
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => Navigator.of(context).pop(),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraLayer(AppTheme theme) {
    if (_granted == null) {
      // 权限询问中：静默黑屏。
      return const ColoredBox(color: Colors.black);
    }
    if (_granted == false) {
      return _PermissionDeniedView(
        onRetry: _ensurePermission,
      );
    }
    return MobileScanner(
      controller: _controller,
      fit: BoxFit.cover,
      onDetect: _onDetect,
      errorBuilder: (context, error, child) => _CameraErrorView(
        error: error,
        onRetry: _ensurePermission,
      ),
    );
  }
}

/// 权限被拒后的兜底视图。
class _PermissionDeniedView extends StatelessWidget {
  const _PermissionDeniedView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.no_photography, color: Colors.white, size: 64),
            const SizedBox(height: 16),
            const Text(
              '需要相机权限才能扫码',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '请在系统设置中允许「家庭管家」使用相机后重试',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: onRetry, child: const Text('重试')),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                '返回',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 相机错误（无相机硬件 / 启动失败）的兜底视图。
class _CameraErrorView extends StatelessWidget {
  const _CameraErrorView({required this.error, required this.onRetry});

  final MobileScannerException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber, color: Colors.white, size: 64),
            const SizedBox(height: 16),
            Text(
              '相机启动失败：${error.errorCode.name}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: onRetry, child: const Text('重试')),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                '返回',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
