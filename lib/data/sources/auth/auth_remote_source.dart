import 'package:dio/dio.dart';

import '../../models/auth/login_response.dart';

class AuthRemoteSource {
  final Dio dio;

  AuthRemoteSource(this.dio);

  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      return LoginResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred.');
    }
  }
}