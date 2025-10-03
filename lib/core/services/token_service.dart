import '../../data/models/auth/access_token_model.dart';

abstract class TokenService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<AccessTokenModel?> getFullToken();
  Future<void> clearToken();
}