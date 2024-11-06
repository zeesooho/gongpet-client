import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/auth/providers/user_provider.dart';
import 'package:gongpet/community/models/post_response.dart';
import 'package:gongpet/global/components/generic_data_state_widget.dart';
import 'package:gongpet/global/formats/date_time_format.dart';

class MyPostsList extends ConsumerWidget {
  const MyPostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericDataStateWidget<PostResponse>(
      fetchData: () => ref.read(userApiClientProvider).getMyPosts(1, 10),
      initialWidget: () => const SizedBox(),
      loadingWidget: () => const Center(child: CircularProgressIndicator()),
      errorWidget: (error) => Center(child: Text('Error: $error')),
      successWidget: (postResponse) => postResponse.posts.isEmpty
          ? const Center(child: Text('작성한 게시글이 없습니다'))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: postResponse.posts.length,
              itemBuilder: (context, index) {
                final post = postResponse.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.content, maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Text(formatDate(post.createdAt)),
                  onTap: () {
                    // TODO: 게시글 상세 페이지로 이동
                  },
                );
              },
            ),
    );
  }
}
