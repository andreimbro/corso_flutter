import 'package:flutter/material.dart';
import 'package:social/pages/Post_page/components/button_postmod.dart';

import '../../models/post.dart';
import 'components/body_page_post.dart';
import 'components/floating_button_comment.dart';

class PostPage extends StatefulWidget {
  final Post post;
  final String idLogUser;
  const PostPage(this.post, {required this.idLogUser, Key? key})
      : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late UniqueKey _key;
  @override
  void initState() {
    _key = UniqueKey();
    super.initState();
  }

  void refresh(bool pop) {
    if (pop == true) {
      setState(() {
        _key = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      floatingActionButton:
          FloatButtonC(callback: refresh, postId: widget.post.id ?? ""),
      appBar: AppBar(),
      body: BodyPagePost(
          refresh: refresh, idLogUser: widget.idLogUser, widget.post),
    );
  }
}
