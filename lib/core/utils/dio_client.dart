import 'package:dio/dio.dart';

import '../services/token_service.dart';

Dio getDioClient(TokenService tokenService) {
  final options = BaseOptions(
    baseUrl: "https://staging.torliga.com/api/v1",
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );

  final dio = Dio(options);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.putIfAbsent("Content-Type", () => "application/json");

        // Attach token if available
        final token = await tokenService.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        final response = error.response;

        // Replace the original DioException with our custom exception
        return handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            response: response,
            type: error.type,
            error: response, // This is the key part!
          ),
        );
      },
    ),
  );

  return dio;
}