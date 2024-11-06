import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                try {
                  await ref.read(authStateProvider.notifier).loginWithKakao();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('로그인 실패: $e')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEE500),
                foregroundColor: const Color(0xFF000000),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Image.asset(
                'assets/images/kakao_login_medium_narrow.png',
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
