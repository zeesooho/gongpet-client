import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoAuthService {
  Future<String?> loginWithKakao() async {
    try {
      // 카카오톡 실행 가능 여부 확인
      if (await isKakaoTalkInstalled()) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          // AccessToken을 직접 가져오도록 수정
          final token = await TokenManagerProvider.instance.manager.getToken();
          return token?.accessToken;
        } catch (error) {
          if (error is PlatformException && error.code == 'CANCELED') {
            return null;
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            await UserApi.instance.loginWithKakaoAccount();
            final token = await TokenManagerProvider.instance.manager.getToken();
            return token?.accessToken;
          } catch (error) {
            return null;
          }
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          final token = await TokenManagerProvider.instance.manager.getToken();
          return token?.accessToken;
        } catch (error) {
          return null;
        }
      }
    } catch (error) {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.unlink();
    } catch (error) {
      print('카카오 로그아웃 실패: $error');
    }
  }
}
