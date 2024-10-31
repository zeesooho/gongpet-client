import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gongpet/auth/auth_state.dart';
import 'package:gongpet/auth/pages/login_page.dart';
import 'package:gongpet/auth/pages/profile_page.dart';
import 'package:gongpet/community/pages/community_page.dart';
import 'package:gongpet/dogmap/dogmap_page.dart';
import 'package:gongpet/dptt/dptt_page.dart';
import 'package:gongpet/adoption/pages/adoption_page.dart';

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const CommunityPage(),
    const DogmapPage(),
    AdoptionPage(),
    const DpttPage(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    if (authState.isLoggedIn && _pages.last is LoginPage) {
      _pages[4] = const ProfilePage();
    } else if (!authState.isLoggedIn && _pages.last is ProfilePage) {
      _pages[4] = const LoginPage();
    }

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.forum), label: '커뮤니티'),
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: '반려견 맵'),
          const BottomNavigationBarItem(icon: Icon(Icons.pets), label: '유기견 입양'),
          const BottomNavigationBarItem(icon: Icon(Icons.psychology), label: '성격 유형'),
          BottomNavigationBarItem(
            icon: Icon(authState.isLoggedIn ? Icons.person : Icons.login),
            label: authState.isLoggedIn ? '내 정보' : '로그인',
          ),
        ],
      ),
    );
  }
}
