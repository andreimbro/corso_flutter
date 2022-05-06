import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social/components/button_like.dart';
import 'package:social/pages/Post_page/post_page.dart';

import '../models/post.dart';
import 'package:social/models/global.dart' as global;

import '../pages/profilo/profilo.dart';

class CardPost extends StatelessWidget {
  final Post post;
  final bool profilo;
  const CardPost({required this.post, this.profilo = false, Key? key})
      : super(key: key);

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
          child: InkWell(
            onTap: (() {
              if (profilo == false) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Profilo(post.owner.id ?? "user not found");
                }));
              }
            }),
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
        Row(
          children: [
            const SizedBox(width: 20),
            Wrap(
              children: [Text(post.text)],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              LikeButton(post),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PostPage(post);
                  }));
                },
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
