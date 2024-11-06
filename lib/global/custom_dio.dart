import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/global/interceptors/token_interceptor.dart';

final baseDioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = dotenv.env['API_SERVER_BASE_URL_DEV_ANDROID'] ?? 'http://10.0.2.2:3000/';
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
  ));

  return dio;
});

final authDioProvider = Provider<Dio>((ref) {
  final dio = ref.watch(baseDioProvider);

  dio.interceptors.clear();

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
  ));

  dio.interceptors.add(TokenInterceptor(ref));

  return dio;
});
