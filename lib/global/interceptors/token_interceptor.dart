import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/providers/auth_provider.dart';
import 'package:gongpet/global/custom_dio.dart';

class TokenInterceptor extends Interceptor {
  final Ref _ref;

  TokenInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.remove('protected') == 'true') {
      final authState = _ref.read(authStateProvider);
      if (authState.accessToken != null) {
        options.headers['Authorization'] = 'Bearer ${authState.accessToken}';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final authNotifier = _ref.read(authStateProvider.notifier);

      if (!err.requestOptions.path.contains('/auth/refresh')) {
        final isRefreshSuccess = await authNotifier.refreshToken();

        if (isRefreshSuccess) {
          final dio = _ref.read(authDioProvider);
          final authState = _ref.read(authStateProvider);

          try {
            final options = err.requestOptions;
            if (options.headers.remove('protected') == 'true') {
              options.headers['Authorization'] = 'Bearer ${authState.accessToken}';
            }

            final response = await dio.fetch(options);
            return handler.resolve(response);
          } on DioException catch (e) {
            return handler.next(e);
          }
        }
      }

      await authNotifier.logout();
    }
    return handler.next(err);
  }
}
