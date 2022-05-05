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
      children: [
        CardPost(post: post),
        Container(
          height: 200,
          child: Column(
            children: [
              Expanded(child: ListaCommenti(post.id!)),
            ],
          ),
        ),
      ],
    );
  }
}
