import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = dotenv.env['API_SERVER_BASE_URL_DEV_WEB'] ?? 'http://10.0.2.2:3000/';
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  dio.options.headers['Access-Control-Allow-Origin'] = "*";
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
  ));
  dio.interceptors.add(ref.read(dioErrorInterceptorProvider));
  return dio;
});

final dioErrorInterceptorProvider = Provider<Interceptor>((ref) {
  return DioErrorInterceptor();
});

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(err.requestOptions.path);
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          // Handle 401 Unauthorized error
          // accessToken인지 refreshToken인지 판단해서 요청 or 로그아웃 처리
        } else if (err.response?.statusCode == 404) {
          // Handle 404 Not Found error
          // 이건 추가로 에러 화면 띄워주거나 home 화면으로 보내든가 처리
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (err.error is SocketException) {}
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        break;
    }
    handler.next(err);
  }
}
