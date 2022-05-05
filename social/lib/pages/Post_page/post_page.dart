import 'package:flutter/material.dart';

import '../../models/post.dart';
import 'components/body_page_post.dart';

class PostPage extends StatelessWidget {
  final Post post;
  const PostPage(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BodyPagePost(post),
    );
  }
}
