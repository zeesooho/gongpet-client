import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/community/models/post.dart';
import 'package:gongpet/community/pages/create_post_page.dart';
import 'package:gongpet/community/pages/post_detail_page.dart';
import 'package:gongpet/community/post_provider.dart';
import 'package:gongpet/global/formats/date_time_format.dart';

// lib/community/pages/community_page.dart
class CommunityPage extends ConsumerWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('커뮤니티'),
      ),
      body: Column(
        children: [
          // 카테고리 필터
          categoriesAsync.when(
            data: (categories) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('전체'),
                    selected: selectedCategoryId == null,
                    onSelected: (selected) {
                      if (selected) {
                        ref.read(selectedCategoryProvider.notifier).state = null;
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  ...categories
                      .map((category) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(category.name),
                              selected: selectedCategoryId == category.id,
                              onSelected: (selected) {
                                ref.read(selectedCategoryProvider.notifier).state = selected ? category.id : null;
                              },
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
            loading: () => const SizedBox(height: 52),
            error: (err, __) => SizedBox(height: 52, child: Text(err.toString())),
          ),

          // 게시글 목록
          Expanded(
            child: postsAsync.when(
              data: (posts) => RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(postsProvider);
                },
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostCard(post: post);
                  },
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('에러가 발생했습니다: $error'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(postId: post.id),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: post.user.userProfile.imageUrl != null ? NetworkImage(post.user.userProfile.imageUrl!) : null,
                    child: post.user.userProfile.imageUrl == null ? const Icon(Icons.person, size: 16) : null,
                  ),
                  const SizedBox(width: 8),
                  Text(post.user.userProfile.nickname),
                  const Spacer(),
                  Text(
                    formatDate(post.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    post.postMeta.views.toString(),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.favorite_border, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    post.postMeta.likes.toString(),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.chat_bubble_outline, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    post.postMeta.commentsCount.toString(),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
