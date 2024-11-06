import 'package:dio/dio.dart' hide Headers;
import 'package:gongpet/community/models/post.dart';
import 'package:gongpet/community/models/post_category.dart';
import 'package:gongpet/community/models/post_response.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api_client.g.dart';

@RestApi()
abstract class PostApiClient {
  factory PostApiClient(Dio dio) = _PostApiClient;

  @GET('/post')
  Future<PostResponse> getPosts({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('categoryId') int? categoryId,
  });

  @GET('/post/{id}')
  Future<Post> getPost(@Path('id') int id);

  @POST('/post')
  @Headers({'protected': 'true'})
  Future<Post> createPost(@Body() Map<String, dynamic> body);

  @DELETE('/post/{id}')
  @Headers({'protected': 'true'})
  Future<void> deletePost(@Path('id') int id);

  @GET('/post/categories')
  Future<List<PostCategory>> getCategories();
}
