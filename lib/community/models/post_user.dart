import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/auth/models/user_profile.dart';

part 'post_user.freezed.dart';
part 'post_user.g.dart';

@freezed
class PostUser with _$PostUser {
  factory PostUser({
    required UserProfile userProfile,
  }) = _PostUser;

  factory PostUser.fromJson(Map<String, dynamic> json) => _$PostUserFromJson(json);
}
