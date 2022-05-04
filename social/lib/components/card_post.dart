import 'package:flutter/material.dart';

import '../models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;
  const CardPost({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.owner.picture ??
                  "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image"),
            ),
            title: Row(
              children: [
                Text(post.owner.firstName),
                const SizedBox(width: 4),
                Text(post.owner.lastName),
              ],
            ),
          ),
        ),
        Image.network(post.image),
        Wrap(
            children: post.tags
                .map((item) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Chip(label: Text(item)),
                    ))
                .toList()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  label: Text(post.likes.toString())),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.comment_bank_outlined),
                label: const Text(""),
              )
            ],
          ),
        )
      ]),
    );
  }
}
