import 'package:flutter/material.dart';

import '../models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;
  const CardPost({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text(post.owner.firstName),
        ),
        Container(
          height: 200,
        ),
        Row(
          children: [Text(post.likes.toString())],
        )
      ]),
    );
  }
}
