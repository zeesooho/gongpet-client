import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/auth/models/user_profile.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String email,
    String? ageRange,
    String? birthday,
    String? birthdayType,
    String? gender,
    required DateTime registrationAt,
    required String role,
    required String from,
    UserProfile? userProfile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
