/// 拍照入库 · 拍照页（image_picker 1.x）。
///
/// 流程：
/// 1. 顶部两个按钮：「📷 拍照」「🖼️ 从相册选」
/// 2. 选完图片 → 调 [DetectApi.detectImage] → 成功 push 到 [PhotoReviewPage]
/// 3. 失败 toast 提示，留在本页重试
///
/// 测试可注入 [pickImageCallback] / [detectApi] 跳过真实相机 / 平台通道。
library;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_theme_extension.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/models/detect_result.dart';
import '../../../providers/app_providers.dart';
import '../../shared/app_button.dart';
import '../../shared/app_card.dart';
import '../../shared/screen_header.dart';
import '../../shared/toast.dart';
import 'photo_review_page.dart';

/// `ImagePicker.pickImage` 注入点。生产 = `ImagePicker().pickImage`，
/// 测试可注入固定 `XFile`。
typedef PickImageCallback = Future<XFile?> Function(ImageSource source);

/// `DetectApi.detectImage` 注入点。
typedef DetectCallback = Future<DetectResult> Function(File file);

/// 拍照入库 · 拍照页。
class PhotoCapturePage extends ConsumerStatefulWidget {
  /// 构造。
  const PhotoCapturePage({
    super.key,
    this.pickImageCallback,
    this.detectCallback,
  });

  /// 测试用：覆盖 image_picker 调用。
  final PickImageCallback? pickImageCallback;

  /// 测试用：覆盖 detect API 调用。
  final DetectCallback? detectCallback;

  @override
  ConsumerState<PhotoCapturePage> createState() => _PhotoCapturePageState();
}

class _PhotoCapturePageState extends ConsumerState<PhotoCapturePage> {
  /// 是否正在上传/识别中。
  bool _busy = false;

  /// 选图回调（默认走 [ImagePicker.pickImage]）。
  Future<XFile?> _defaultPick(ImageSource source) =>
      ImagePicker().pickImage(source: source, imageQuality: 85);

  /// 默认 detect 回调：从 Riverpod 读 [DetectApi]。
  Future<DetectResult> _defaultDetect(File file) =>
      ref.read(detectApiProvider).detectImage(file);

  /// "拍照"按钮。
  Future<void> _onTakePhoto() async {
    await _pickAndProcess(ImageSource.camera);
  }

  /// "从相册选"按钮。
  Future<void> _onPickFromGallery() async {
    await _pickAndProcess(ImageSource.gallery);
  }

  /// 选图 + 上传 + 跳 review。
  ///
  /// 任一环节失败：toast 提示并留在本页。
  Future<void> _pickAndProcess(ImageSource source) async {
    if (_busy) return;
    final pick = widget.pickImageCallback ?? _defaultPick;
    final detect = widget.detectCallback ?? _defaultDetect;
    setState(() => _busy = true);
    try {
      final xfile = await pick(source);
      if (!mounted) return;
      if (xfile == null) {
        setState(() => _busy = false);
        return; // 用户取消
      }
      // 调 detect（loading 在按钮区域展示）。
      final result = await detect(File(xfile.path));
      if (!mounted) return;
      // push review 页（自己保持存活，review pop 后会回这里）。
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PhotoReviewPage(
            imageFile: File(xfile.path),
            detectResult: result,
          ),
        ),
      );
      if (!mounted) return;
      setState(() => _busy = false);
    } catch (e) {
      if (!mounted) return;
      setState(() => _busy = false);
      showAppToast(context, '识别失败：$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: '🖼️ 拍照入库',
              actionIcon: '✕',
              onAction: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('拍摄或选择商品照片',
                              style: AppTextStyles.sans(15,
                                      weight: FontWeight.w700)
                                  .copyWith(color: theme.textPrimary)),
                          const SizedBox(height: 6),
                          Text(
                            '后端会自动识别图中所有商品；你可以逐一确认或新增后再批量入库',
                            style: AppTextStyles.sans(12,
                                color: theme.textSecondary),
                          ),
                          const SizedBox(height: 16),
                          // 📷 拍照
                          AppButton(
                            label: _busy ? '上传中…' : '📷 拍照',
                            kind: AppButtonKind.primary,
                            block: true,
                            onPressed: _busy ? null : _onTakePhoto,
                          ),
                          const SizedBox(height: 10),
                          // 🖼️ 从相册
                          AppButton(
                            label: '🖼️ 从相册选',
                            kind: AppButtonKind.secondary,
                            block: true,
                            onPressed: _busy ? null : _onPickFromGallery,
                          ),
                          if (_busy) ...[
                            const SizedBox(height: 16),
                            const Center(
                              child: SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
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
}
