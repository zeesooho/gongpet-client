import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/auth_api_client.dart';
import 'package:gongpet/auth/kakao_auth_service.dart';
import 'package:gongpet/global/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final kakaoAuthServiceProvider = Provider((ref) => KakaoAuthService());

final authApiClientProvider = Provider((ref) {
  final dio = ref.watch(baseDioProvider);
  return AuthApiClient(dio);
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.watch(authApiClientProvider),
    ref.watch(kakaoAuthServiceProvider),
  );
});

class AuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final String? accessToken;
  final String? refreshToken;

  const AuthState({
    this.isLoggedIn = false,
    this.isLoading = false,
    this.accessToken,
    this.refreshToken,
  });

  AuthState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthApiClient _authClient;
  final KakaoAuthService _kakaoAuthService;
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  AuthNotifier(this._authClient, this._kakaoAuthService) : super(const AuthState());

  Future<void> loginWithKakao() async {
    try {
      state = state.copyWith(isLoading: true);

      final kakaoToken = await _kakaoAuthService.loginWithKakao();
      if (kakaoToken != null) {
        final response = await _authClient.loginWithKakaoToken({'token': kakaoToken});
        await _saveTokens(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );
        state = AuthState(
          isLoggedIn: true,
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );
      }
    } catch (e) {
      // 로그인 실패 시 상태 초기화
      state = const AuthState();
      rethrow;
    } finally {
      // 로딩 상태 해제
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> logout() async {
    try {
      if (state.refreshToken != null) {
        await _authClient.logout({'refreshToken': state.refreshToken!});
      }
    } catch (e) {
      rethrow;
    } finally {
      await _kakaoAuthService.logout();
      await _clearTokens();
      state = const AuthState();
    }
  }

  Future<void> logoutAllDevices() async {
    try {
      await _authClient.logoutAll();
    } catch (e) {
      rethrow;
    } finally {
      await _kakaoAuthService.logout();
      await _clearTokens();
      state = const AuthState();
    }
  }

  Future<bool> refreshToken() async {
    try {
      if (state.refreshToken == null) return false;

      final response = await _authClient.refreshToken({
        'refreshToken': state.refreshToken!,
      });

      await _saveTokens(
        accessToken: response['accessToken']!,
        refreshToken: state.refreshToken!,
      );

      state = state.copyWith(
        accessToken: response['accessToken'],
        isLoggedIn: true,
      );

      return true;
    } catch (e) {
      // 토큰 갱신 실패 시 로그아웃 처리
      await _clearTokens();
      state = const AuthState();
      return false;
    }
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.setString(_accessTokenKey, accessToken),
        prefs.setString(_refreshTokenKey, refreshToken),
      ]);
    } catch (e) {
      print('토큰 저장 실패: $e');
      rethrow;
    }
  }

  Future<void> _clearTokens() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.remove(_accessTokenKey),
        prefs.remove(_refreshTokenKey),
      ]);
    } catch (e) {
      print('토큰 삭제 실패: $e');
      // 토큰 삭제 실패는 조용히 처리
    }
  }

  Future<void> loadAuthState() async {
    try {
      state = state.copyWith(isLoading: true);

      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString(_accessTokenKey);
      final refreshToken = prefs.getString(_refreshTokenKey);

      if (accessToken != null && refreshToken != null) {
        state = AuthState(
          isLoggedIn: true,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
        // 선택적: 토큰 유효성 검증
        // _validateToken();
      }
    } catch (e) {
      print('인증 상태 로드 실패: $e');
      state = const AuthState();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // Future<void> _validateToken() async {
  //   try {
  //     await _authClient.getMyProfile();
  //   } catch (e) {
  //     await logout();
  //   }
  // }
}
