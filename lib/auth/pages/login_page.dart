import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/auth_state.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  // 카카오톡 앱으로 로그인 함수 (실제 구현은 별도로 작성 필요)
  Future<void> _loginWithKakaoApp(WidgetRef ref) async {
    // TODO: Implement Kakao app login
    await ref.read(authStateProvider.notifier).login('temp_token', 'temp_refresh_token');
  }

  // 카카오톡 계정으로 로그인 함수 (실제 구현은 별도로 작성 필요)
  Future<void> _loginWithKakaoAccount(WidgetRef ref) async {
    // TODO: Implement Kakao account login
    await ref.read(authStateProvider.notifier).login('temp_token', 'temp_refresh_token');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _loginWithKakaoApp(ref);
              },
              child: const Text('카카오톡 앱으로 로그인'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _loginWithKakaoAccount(ref);
              },
              child: const Text('카카오톡 계정으로 로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
