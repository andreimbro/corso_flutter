import 'package:flutter/material.dart';
import 'package:social/components/card_post.dart';
import 'package:social/pages/Post_page/components/lista_commenti.dart';

import '../../../models/post.dart';

class BodyPagePost extends StatelessWidget {
  final String idLogUser;
  final Post post;
  final Function refresh;
  const BodyPagePost(this.post,
      {required this.refresh, required this.idLogUser, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CardPost(
            refresh: refresh,
            idLogUser: idLogUser,
            post: post,
            iconComment: false),
        ListaCommenti(post.id!,
            idLogUser: idLogUser, idUserPost: post.owner.id ?? ""),
      ],
    );
  }
}
