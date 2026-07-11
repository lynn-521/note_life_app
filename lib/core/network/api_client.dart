/// 双地址自动切换 HTTP 客户端（backend_design §2.2）。
///
/// 优先内网（短超时 1500ms）→ 超时 / 连接失败 / 非 2xx → 自动回退外网（长超时）；
/// 记忆「当前可用地址」减少探测；[isReachable] 用 GET {baseUrl}/{healthPath} 探测。
library;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../data/models/family_server_config.dart';

/// HTTP 响应封装。
class ApiResponse {
  /// 构造。
  const ApiResponse({required this.statusCode, required this.body});

  /// HTTP 状态码。
  final int statusCode;

  /// 响应体文本。
  final String body;

  /// 是否成功（2xx）。
  bool get ok => statusCode >= 200 && statusCode < 300;
}

/// API 异常（含非 2xx 状态码，供上层决定回退）。
class ApiException implements Exception {
  /// 构造。
  const ApiException(this.message, [this.statusCode]);

  /// 错误信息。
  final String message;

  /// 可选 HTTP 状态码。
  final int? statusCode;

  @override
  String toString() =>
      'ApiException(${statusCode ?? '?'}) : $message';
}

/// 双地址自动切换 HTTP 客户端。
///
/// 封装内网优先、失败回退外网、记忆可用地址的切网逻辑，供 [HttpSyncEngine]
/// 发起 /sync/* 请求；亦供「服务器设置」页做可达性探测。
class ApiClient {
  /// 构造。
  ApiClient(this.config);

  /// 当前服务器配置（内/外网地址、超时、令牌）。
  FamilyServerConfig config;

  /// 记忆的当前可用地址（命中后不再每次探测内网）。
  String? _activeBaseUrl;

  /// 更新配置（配置变更后调用，重置记忆地址）。
  void updateConfig(FamilyServerConfig cfg) {
    config = cfg;
    _activeBaseUrl = null;
  }

  /// 统一请求入口：① 优先记忆地址或内网（短超时）→ ② 失败回退外网（长超时）
  /// → ③ 回退成功则记忆该地址。
  Future<ApiResponse> request({
    required String method,
    required String path,
    Object? body,
  }) async {
    final primary = _activeBaseUrl ?? config.internalBaseUrl;
    try {
      return await _send(primary, method, path, body, config.timeoutMs);
    } on TimeoutException {
      return _fallback(method, path, body);
    } on SocketException {
      return _fallback(method, path, body);
    } on ApiException catch (e) {
      // 非 2xx（如 401 令牌错误 / 502）也尝试回退外网。
      if (e.statusCode != null && (e.statusCode! < 200 || e.statusCode! >= 300)) {
        return _fallback(method, path, body);
      }
      rethrow;
    }
  }

  /// 回退到外网并记忆可用地址。
  Future<ApiResponse> _fallback(String method, String path, Object? body) async {
    final fallback = config.externalBaseUrl;
    final resp = await _send(fallback, method, path, body, config.timeoutMs * 4);
    _activeBaseUrl = fallback;
    return resp;
  }

  /// 用 GET {baseUrl}/{healthPath} 探测可达性（探活失败返回 false）。
  Future<bool> isReachable(String baseUrl) async {
    if (baseUrl.trim().isEmpty) return false;
    try {
      final r = await _send(
        baseUrl,
        'GET',
        config.healthPath,
        null,
        config.timeoutMs,
      );
      return r.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// 便捷 GET。
  Future<ApiResponse> get(String path) =>
      request(method: 'GET', path: path);

  /// 便捷 POST。
  Future<ApiResponse> post(String path, [Object? body]) =>
      request(method: 'POST', path: path, body: body);

  /// 底层发送：写 Bearer 头 + JSON 体，按超时限制；非 2xx 抛 [ApiException]。
  Future<ApiResponse> _send(
    String baseUrl,
    String method,
    String path,
    Object? body,
    int timeoutMs,
  ) async {
    if (baseUrl.trim().isEmpty) {
      throw const SocketException('base url is empty');
    }
    final uri = Uri.parse('$baseUrl$path');
    final client = HttpClient();
    try {
      final req = await client.openUrl(method, uri);
      req.headers.set('Authorization', 'Bearer ${config.token}');
      req.headers.set('Content-Type', 'application/json');
      req.persistentConnection = false;
      if (body != null) {
        final bytes = utf8.encode(jsonEncode(body));
        req.add(bytes);
      }
      final resp = await req
          .close()
          .timeout(Duration(milliseconds: timeoutMs));
      final bodyText = await resp.transform(utf8.decoder).join();
      if (resp.statusCode < 200 || resp.statusCode >= 300) {
        throw ApiException('HTTP ${resp.statusCode}', resp.statusCode);
      }
      return ApiResponse(statusCode: resp.statusCode, body: bodyText);
    } finally {
      client.close(force: true);
    }
  }
}
