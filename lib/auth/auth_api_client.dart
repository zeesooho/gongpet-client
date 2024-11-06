import 'package:dio/dio.dart' hide Headers;
import 'package:gongpet/auth/models/device_info.dart';
import 'package:gongpet/auth/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @GET('/auth/kakao/code')
  Future<LoginResponse> loginWithKakaoCode(@Query('code') String code);

  @POST('/auth/kakao/token')
  Future<LoginResponse> loginWithKakaoToken(@Body() Map<String, String> body);

  @POST('/auth/refresh')
  Future<Map<String, String>> refreshToken(@Body() Map<String, String> body);

  @POST('/auth/logout')
  Future<void> logout(@Body() Map<String, String> body);

  @POST('/auth/logout-all')
  Future<void> logoutAll();

  @GET('/auth/devices')
  Future<List<DeviceInfo>> getActiveDevices();
}
