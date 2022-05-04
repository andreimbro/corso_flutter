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
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.owner.picture ??
                "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image"),
          ),
          title: Text(post.owner.firstName),
        ),
        Container(
          height: 200,
          child: Image.network(post.image),
        ),
        Row(
            children:
                post.tags.map((item) => Chip(label: Text(item))).toList()),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            ),
            Text(post.likes.toString())
          ],
        )
      ]),
    );
  }
}
