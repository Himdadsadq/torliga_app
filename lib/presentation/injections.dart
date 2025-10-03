import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:torliga_app/core/services/token_service.dart';
import 'package:torliga_app/core/services/token_service_impl.dart';
import 'package:torliga_app/core/utils/dio_client.dart';
import 'package:torliga_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:torliga_app/data/sources/auth/auth_local_source.dart';
import 'package:torliga_app/data/sources/auth/auth_remote_source.dart';
import 'package:torliga_app/domain/repositories/auth/auth_repository.dart';
import 'package:torliga_app/domain/usecases/auth/login_usecase.dart';

import 'bloc/auth/login_bloc.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  getIt.registerLazySingleton<TokenService>(() => TokenServiceImpl());
  getIt.registerLazySingleton<Dio>(() => getDioClient(getIt<TokenService>()));
  getIt.registerLazySingleton(() => AuthRemoteSource(getIt<Dio>()));
  getIt.registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<Dio>(), getIt<AuthRemoteSource>(), getIt<AuthLocalSource>(), getIt<TokenService>()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<AuthRepository>()));
}