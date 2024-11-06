import 'package:dio/dio.dart' hide Headers;
import 'package:gongpet/auth/models/user.dart';
import 'package:gongpet/auth/models/user_profile.dart';
import 'package:gongpet/community/models/post_response.dart';
import 'package:gongpet/pet/models/pet.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio) = _UserApiClient;

  @GET('/user/me')
  @Headers({'protected': 'true'})
  Future<User> getMyProfile();

  @POST('/user/me/profile-image')
  @Headers({'protected': 'true'})
  Future<UserProfile> updateProfileImage(@Body() FormData formData);

  @GET('/user/me/posts')
  @Headers({'protected': 'true'})
  Future<PostResponse> getMyPosts(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/user/me/pets')
  @Headers({'protected': 'true'})
  Future<List<Pet>> getMyPets();
}
