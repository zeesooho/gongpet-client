import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/community/models/post_category.dart';
import 'package:gongpet/community/post_provider.dart';
import 'package:gongpet/global/formats/date_time_format.dart';

class PostDetailPage extends ConsumerWidget {
  final int postId;

  const PostDetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postDetailProvider(postId));
    final categories = ref.read(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
      ),
      body: postAsync.when(
        data: (post) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  getCategoryName(post.categoryId, categories.value!),
                                  style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: post.user.userProfile.imageUrl != null ? NetworkImage(post.user.userProfile.imageUrl!) : null,
                                child: post.user.userProfile.imageUrl == null ? const Icon(Icons.person) : null,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                post.user.userProfile.nickname,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                formatDate(post.createdAt),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const Divider(height: 32),
                          Text(
                            post.content,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                          const Divider(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildStatItem(
                                Icons.remove_red_eye_outlined,
                                post.postMeta.views.toString(),
                              ),
                              const SizedBox(width: 24),
                              _buildStatItem(
                                Icons.favorite_border,
                                post.postMeta.likes.toString(),
                                onTap: () {
                                  // TODO: 좋아요 기능 구현
                                },
                              ),
                              const SizedBox(width: 24),
                              _buildStatItem(
                                Icons.chat_bubble_outline,
                                post.postMeta.commentsCount.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (post.comments != null && post.comments!.isNotEmpty) ...[
                      const Divider(height: 1),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: post.comments!.length,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final comment = post.comments![index];
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage: comment.user.userProfile.imageUrl != null ? NetworkImage(comment.user.userProfile.imageUrl!) : null,
                                      child: comment.user.userProfile.imageUrl == null ? const Icon(Icons.person, size: 16) : null,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      comment.user.userProfile.nickname,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      formatDate(comment.createdAt),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(comment.content),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // TODO: 댓글 좋아요 기능 구현
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.favorite_border, size: 16),
                                          const SizedBox(width: 4),
                                          Text(comment.likes.toString()),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    TextButton(
                                      onPressed: () {
                                        // TODO: 답글 작성 기능 구현
                                      },
                                      child: const Text('답글 작성'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 16 + MediaQuery.of(context).padding.bottom),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '댓글을 입력하세요',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: 댓글 작성 기능 구현
                    },
                    child: const Text('작성'),
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('에러가 발생했습니다: $error'),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String count, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 4),
          Text(count),
        ],
      ),
    );
  }

  String getCategoryName(int? categoryId, List<PostCategory> categories) {
    var categoryName = '전체';
    if (categoryId == null) categoryName;
    categories.forEach((category) {
      if (category.id == categoryId) categoryName = category.name;
    });
    return categoryName;
  }
}
