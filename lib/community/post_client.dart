import 'package:dio/dio.dart';
import 'package:gongpet/community/models/post.dart';
import 'package:gongpet/community/models/post_category.dart';
import 'package:gongpet/community/models/post_response.dart';
import 'package:retrofit/retrofit.dart';

part 'post_client.g.dart';

@RestApi()
abstract class PostClient {
  factory PostClient(Dio dio) = _PostClient;

  @GET('/post')
  Future<PostResponse> getPosts({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('categoryId') int? categoryId,
  });

  @GET('/post/{id}')
  Future<Post> getPost(@Path('id') int id);

  @POST('/post')
  Future<Post> createPost(@Body() Map<String, dynamic> body);

  @DELETE('/post/{id}')
  Future<void> deletePost(@Path('id') int id);

  @GET('/post/categories')
  Future<List<PostCategory>> getCategories();
}
