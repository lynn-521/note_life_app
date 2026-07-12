/// `/inbound/detect` 客户端（multipart/form-data 上传图片）。
///
/// 与 `core/network/api_client.dart` 的关系：双地址回退、鉴权、超时三个
/// 关注点一致，但 api_client 走 JSON body，本客户端走 multipart/form-data
/// （`http.MultipartRequest`），是独立路径，故不复用。
///
/// 鉴权：`Authorization: Bearer <FAMILY_TOKEN>`（同其它受保护路由）。
/// 端点契约：见 `note_life_backend/docs/inbound-detect.md` §1。
library;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/detect_result.dart';
import '../models/family_server_config.dart';

/// `/inbound/detect` 调用异常（含非 200 状态码 / 网络错误）。
class DetectApiException implements Exception {
  /// 构造。
  const DetectApiException(this.message, [this.statusCode]);

  /// 错误信息。
  final String message;

  /// 可选 HTTP 状态码。
  final int? statusCode;

  @override
  String toString() =>
      'DetectApiException(${statusCode ?? '?'}) : $message';
}

/// `/inbound/detect` HTTP 客户端。
///
/// 双地址回退：内网（短超时）→ 失败回退外网（长超时）→ 错误抛
/// [DetectApiException] 给上层处理。
class DetectApi {
  /// 构造。
  DetectApi(this.config);

  /// 服务器配置（内/外网地址 + FAMILY_TOKEN + 超时）。
  final FamilyServerConfig config;

  /// 上传图片到 `/inbound/detect` 并反序列化为 [DetectResult]。
  ///
  /// 任一地址（内/外网）成功即返回；两边都失败抛 [DetectApiException]。
  Future<DetectResult> detectImage(File imageFile) async {
    // 1. 优先内网（任何异常都尝试外网兜底）
    try {
      return await _postOnce(config.internalBaseUrl, imageFile);
    } catch (_) {
      // 2. 兜底走外网
      return _postOnce(config.externalBaseUrl, imageFile);
    }
  }

  /// 单次 POST。
  ///
  /// 内网走短超时，外网走 `timeoutMs * 4`（与 ApiClient 一致）。
  Future<DetectResult> _postOnce(String baseUrl, File imageFile) async {
    if (baseUrl.trim().isEmpty) {
      throw const SocketException('base url is empty');
    }
    final uri = Uri.parse('$baseUrl/inbound/detect');
    final req = http.MultipartRequest('POST', uri);
    req.headers['Authorization'] = 'Bearer ${config.token}';
    req.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    // http.MultipartRequest.send() 不带超时，需包一层
    final streamed = await req.send().timeout(
          Duration(milliseconds: config.timeoutMs * 4),
        );
    final resp = await http.Response.fromStream(streamed);
    if (resp.statusCode < 200 || resp.statusCode >= 300) {
      throw DetectApiException(
        'HTTP ${resp.statusCode} : ${resp.body}',
        resp.statusCode,
      );
    }
    final json = jsonDecode(resp.body) as Map<String, dynamic>;
    return DetectResult.fromJson(json);
  }
}
