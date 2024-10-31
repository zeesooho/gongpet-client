import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/community/post_client.dart';
import 'package:gongpet/global/custom_dio.dart';

final postClientProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return PostClient(dio);
});

final selectedCategoryProvider = StateProvider<int?>((ref) => null);

final categoriesProvider = FutureProvider((ref) async {
  final client = ref.watch(postClientProvider);
  return client.getCategories();
});

final postsProvider = FutureProvider.autoDispose((ref) async {
  final client = ref.watch(postClientProvider);
  final selectedCategoryId = ref.watch(selectedCategoryProvider);
  final response = await client.getPosts(
    page: 1,
    limit: 20,
    categoryId: selectedCategoryId,
  );

  return response.posts;
});

final postDetailProvider = FutureProvider.family.autoDispose((ref, int id) async {
  final client = ref.watch(postClientProvider);
  return client.getPost(id);
});
