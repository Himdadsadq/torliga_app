import 'package:torliga_app/data/models/auth/user_model.dart';

class LoginResponse {
  final String token;
  final UserModel user;

  LoginResponse({
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print(json['user']);
    return LoginResponse(
      token: json['access_token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}