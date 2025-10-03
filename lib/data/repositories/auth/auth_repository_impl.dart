import 'package:dio/dio.dart';
import 'package:torliga_app/core/services/token_service.dart';
import 'package:torliga_app/data/models/auth/access_token_model.dart';
import 'package:torliga_app/data/sources/auth/auth_local_source.dart';
import 'package:torliga_app/data/sources/auth/auth_remote_source.dart';

import '../../../domain/repositories/auth/auth_repository.dart';
import '../../models/auth/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final AuthRemoteSource remoteSource;
  final AuthLocalSource localSource;
  final TokenService tokenService;

  AuthRepositoryImpl(this.dio, this.remoteSource, this.localSource, this.tokenService);

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await remoteSource.login(email, password);

    await tokenService.saveToken(response.token);
    await localSource.putUser(response.user);

    return response;
  }
}