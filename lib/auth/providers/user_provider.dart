import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/models/user.dart';
import 'package:gongpet/auth/user_api_client.dart';
import 'package:gongpet/global/custom_dio.dart';

final userApiClientProvider = Provider<UserApiClient>((ref) {
  return UserApiClient(ref.read(authDioProvider));
});

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, AsyncValue<User>>((ref) {
  return UserProfileNotifier(ref.watch(userApiClientProvider));
});

class UserProfileNotifier extends StateNotifier<AsyncValue<User>> {
  final UserApiClient _apiClient;

  UserProfileNotifier(this._apiClient) : super(const AsyncValue.loading()) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      final user = await _apiClient.getMyProfile();
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateProfileImage(FormData formData) async {
    try {
      state = const AsyncValue.loading();
      final updatedProfile = await _apiClient.updateProfileImage(formData);

      // 프로필 정보 다시 불러오기
      await fetchProfile();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
}
