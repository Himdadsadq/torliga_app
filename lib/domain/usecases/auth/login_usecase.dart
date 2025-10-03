import 'package:torliga_app/domain/repositories/auth/auth_repository.dart';

import '../../../data/models/auth/login_response.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(String username, String password) async {
    return await repository.login(username, password);
  }
}