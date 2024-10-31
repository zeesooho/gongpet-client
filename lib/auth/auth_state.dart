import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthState {
  final bool isLoggedIn;
  final String? accessToken;
  final String? refreshToken;

  AuthState({this.isLoggedIn = false, this.accessToken, this.refreshToken});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String accessToken, String refreshToken) async {
    state = AuthState(isLoggedIn: true, accessToken: accessToken, refreshToken: refreshToken);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  Future<void> logout() async {
    state = AuthState();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('refreshToken');
  }

  Future<bool> refreshToken() async {
    return false;
  }

  Future<void> loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final refreshToken = prefs.getString('refreshToken');
    if (accessToken != null && refreshToken != null) {
      state = AuthState(isLoggedIn: true, accessToken: accessToken, refreshToken: refreshToken);
    }
  }
}
