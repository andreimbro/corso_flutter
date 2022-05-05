import 'package:flutter/material.dart';
import 'package:social/components/card_post.dart';
import 'package:social/pages/Post_page/components/lista_commenti.dart';

import '../../../models/post.dart';

class BodyPagePost extends StatelessWidget {
  final Post post;
  const BodyPagePost(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CardPost(post: post),
        ListaCommenti(post.id!),
      ],
    );
  }
}