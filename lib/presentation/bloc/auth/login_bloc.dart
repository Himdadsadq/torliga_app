import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth/auth_repository.dart';

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  // copyWith method
  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class LoginBloc extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    await authRepository.login(email, password);

    emit(state.copyWith(
      isLoading: false,
      isSuccess: true,
    ));
  }

  void reset() {
    emit(const LoginState());
  }
}
