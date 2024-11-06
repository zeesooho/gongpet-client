import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/providers/auth_provider.dart';
import 'package:gongpet/pet/components/my_pets_list.dart';
import 'package:gongpet/auth/components/my_posts_list.dart';
import 'package:gongpet/auth/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  Future<void> _pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('프로필 사진 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('카메라로 촬영'),
                onTap: () async {
                  final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 70,
                    preferredCameraDevice: CameraDevice.front,
                  );
                  if (context.mounted) Navigator.pop(context, photo);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('갤러리에서 선택'),
                onTap: () async {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 70,
                  );
                  if (context.mounted) Navigator.pop(context, image);
                },
              ),
            ],
          ),
        );
      },
    );

    if (image != null && mounted) {
      try {
        // 파일 존재 여부 확인
        final file = File(image.path);
        if (!await file.exists()) {
          throw Exception('Selected image file does not exist');
        }

        // 파일 크기 확인
        final fileSize = await file.length();
        if (fileSize > 5 * 1024 * 1024) {
          // 5MB 제한
          throw Exception('File size exceeds 5MB limit');
        }

        // 파일 타입 확인
        final extension = image.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png', 'gif', 'heic', 'webp'].contains(extension)) {
          throw Exception('Unsupported file type: $extension');
        }

        // 디버깅을 위한 정보 출력
        print('Uploading image:');
        print('Path: ${file.path}');
        print('Size: ${fileSize} bytes');

        // FormData 직접 생성
        final formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(
            file.path,
            filename: image.name,
            contentType: MediaType.parse('image/$extension'),
          ),
        });

        // API 호출
        await ref.read(userProfileProvider.notifier).updateProfileImage(formData);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('프로필 사진이 업데이트되었습니다.'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        print('Profile image upload error: $e'); // 디버깅을 위한 에러 로깅
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('프로필 사진 업데이트 실패: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(userProfileProvider.notifier).fetchProfile(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.read(userProfileProvider.notifier).fetchProfile(),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
        data: (user) => RefreshIndicator(
          onRefresh: () => ref.read(userProfileProvider.notifier).fetchProfile(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickAndUploadImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: user.userProfile?.imageUrl != null ? NetworkImage(user.userProfile!.imageUrl!) : null,
                        child: user.userProfile?.imageUrl == null ? const Icon(Icons.person, size: 50) : null,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoTile('닉네임', user.userProfile?.nickname ?? '미설정'),
                _buildInfoTile('이메일', user.email),
                if (user.ageRange != null) _buildInfoTile('연령대', user.ageRange!),
                if (user.gender != null) _buildInfoTile('성별', user.gender!),
                const SizedBox(height: 20),
                _buildSection(
                  title: '내 반려견',
                  child: MyPetsList(),
                ),
                _buildSection(
                  title: '내 게시글',
                  child: MyPostsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child,
      ],
    );
  }
}
