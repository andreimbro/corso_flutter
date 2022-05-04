import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/post.dart';
import 'package:social/models/global.dart' as global;

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
              backgroundImage:
                  NetworkImage(post.owner.picture ?? global.ImangeNotFound),
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
        Padding(
          padding: const EdgeInsets.only(right: 12, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (post.publishDate != null)
                Text(
                  DateFormat.yMMMMd('it_IT').add_Hm().format(
                        DateTime.parse(post.publishDate!),
                      ),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal),
                ),
            ],
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
