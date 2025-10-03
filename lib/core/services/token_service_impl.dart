
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:torliga_app/core/services/token_service.dart';

import '../../data/models/auth/access_token_model.dart';

class TokenServiceImpl implements TokenService {
  final _storage = FlutterSecureStorage();

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    final tokenJson = await _storage.read(key: 'access_token');
    if (tokenJson != null && tokenJson.isNotEmpty) {
      try {
        final tokenData = jsonDecode(tokenJson) as Map<String, dynamic>;
        return tokenData['token'] as String?;
      } catch (e) {
        await clearToken();
        return null;
      }
    }
    return null;
  }

  @override
  Future<AccessTokenModel?> getFullToken() async {
    final tokenJson = await _storage.read(key: 'access_token');

    if (tokenJson == null || tokenJson.isEmpty) {
      return null;
    }

    try {
      final tokenData = jsonDecode(tokenJson) as Map<String, dynamic>;
      return AccessTokenModel.fromJson(tokenData);
    } catch (e) {
      await clearToken();
      return null;
    }
  }

  @override
  Future<void> clearToken() async {
    await _storage.delete(key: 'access_token');
  }
}

