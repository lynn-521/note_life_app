/// 家庭服务器连接配置（backend_design §2.1）。
///
/// 「我的 → 服务器设置」可编辑并持久化到 [SharedPreferences]。
/// 含内网 / 外网双地址、健康检查路径、内网短超时与共享密钥（FAMILY_TOKEN）。
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 家庭服务器连接配置。
class FamilyServerConfig {
  /// 构造。
  const FamilyServerConfig({
    required this.internalBaseUrl,
    required this.externalBaseUrl,
    this.healthPath = '/healthz',
    this.timeoutMs = 1500,
    required this.token,
  });

  /// 内网地址，如 http://192.168.1.20:8000。
  final String internalBaseUrl;

  /// 外网地址，如 https://note-life.example.com。
  final String externalBaseUrl;

  /// 健康检查路径，默认 '/healthz'（后端公开探活）。
  final String healthPath;

  /// 内网短超时（毫秒），默认 1500。
  final int timeoutMs;

  /// 家庭共享密钥 FAMILY_TOKEN（Bearer）。
  final String token;

  /// 是否已配置至少一个地址。
  bool get isConfigured =>
      internalBaseUrl.trim().isNotEmpty ||
      externalBaseUrl.trim().isNotEmpty;

  /// 从 JSON 反序列化（字段缺省取默认值）。
  factory FamilyServerConfig.fromJson(Map<String, dynamic> json) =>
      FamilyServerConfig(
        internalBaseUrl: (json['internalBaseUrl'] as String?) ?? '',
        externalBaseUrl: (json['externalBaseUrl'] as String?) ?? '',
        healthPath: (json['healthPath'] as String?) ?? '/healthz',
        timeoutMs: (json['timeoutMs'] as int?) ?? 1500,
        token: (json['token'] as String?) ?? '',
      );

  /// 序列化为 JSON。
  Map<String, dynamic> toJson() => <String, dynamic>{
        'internalBaseUrl': internalBaseUrl,
        'externalBaseUrl': externalBaseUrl,
        'healthPath': healthPath,
        'timeoutMs': timeoutMs,
        'token': token,
      };

  /// 拷贝并覆盖指定字段。
  FamilyServerConfig copyWith({
    String? internalBaseUrl,
    String? externalBaseUrl,
    String? healthPath,
    int? timeoutMs,
    String? token,
  }) =>
      FamilyServerConfig(
        internalBaseUrl: internalBaseUrl ?? this.internalBaseUrl,
        externalBaseUrl: externalBaseUrl ?? this.externalBaseUrl,
        healthPath: healthPath ?? this.healthPath,
        timeoutMs: timeoutMs ?? this.timeoutMs,
        token: token ?? this.token,
      );

  /// 未配置空实例。
  factory FamilyServerConfig.empty() => const FamilyServerConfig(
        internalBaseUrl: '',
        externalBaseUrl: '',
        token: '',
      );

  /// 从 [SharedPreferences] 读取（缺省返回空配置）。
  static Future<FamilyServerConfig> fromPreferences(
      SharedPreferences prefs) async {
    final raw = prefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) return FamilyServerConfig.empty();
    try {
      return FamilyServerConfig.fromJson(
          jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return FamilyServerConfig.empty();
    }
  }

  /// 写入 [SharedPreferences]。
  Future<void> saveToPreferences(SharedPreferences prefs) async {
    await prefs.setString(_prefsKey, jsonEncode(toJson()));
  }

  static const String _prefsKey = 'family_butler_server_config';
}
