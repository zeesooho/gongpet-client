import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/auth_state.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  Future<Map<String, dynamic>> _fetchProfileData() async {
    final authState = ref.read(authStateProvider);
    if (!authState.isLoggedIn) {
      throw Exception('Not logged in');
    }

    // TODO: Implement actual API call to fetch profile data
    // Use authState.token for authentication

    // 임시 프로필 데이터 (실제 구현에서는 제거)
    await Future.delayed(const Duration(seconds: 1)); // 네트워크 지연 시뮬레이션
    return {
      'profileImage': 'https://via.placeholder.com/150',
      'name': '홍길동',
      'email': 'example@example.com',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final profileData = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profileData['profileImage'] ?? ''),
                  ),
                  const SizedBox(height: 20),
                  Text('이름: ${profileData['name'] ?? ''}'),
                  Text('이메일: ${profileData['email'] ?? ''}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No profile data available'));
          }
        },
      ),
    );
  }
}
