import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social/components/button_like.dart';
import 'package:social/pages/Post_page/components/button_postmod.dart';
import 'package:social/pages/Post_page/post_page.dart';

import '../models/post.dart';
import 'package:social/models/global.dart' as global;

import '../pages/profilo/profilo.dart';

class CardPost extends StatefulWidget {
  final Post post;
  final bool profilo;
  final String idLogUser;
  final Function refresh;
  final bool iconComment;
  const CardPost(
      {required this.idLogUser,
      required this.post,
      required this.refresh,
      this.iconComment = true,
      this.profilo = false,
      Key? key})
      : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (() {
                    if (widget.profilo == false) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profilo(
                          widget.post.owner.id ?? "user not found",
                          idLogUser: widget.idLogUser,
                        );
                      }));
                    }
                  }),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.post.owner.picture ?? global.imangeNotFound),
                    ),
                    title: Row(
                      children: [
                        Text(widget.post.owner.firstName),
                        const SizedBox(width: 4),
                        Text(widget.post.owner.lastName),
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.post.owner.id == widget.idLogUser)
                ButtonPostMod(widget.refresh, widget.post),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.post.publishDate != null)
                Text(
                  DateFormat.yMMMMd('it_IT').add_Hm().format(
                        DateTime.parse(widget.post.publishDate!),
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
        Image.network(widget.post.image),
        Wrap(
            children: widget.post.tags
                .map((item) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Visibility(
                          visible: widget.post.tags != [],
                          child: Chip(label: Text(item))),
                    ))
                .toList()),
        const SizedBox(width: 20),
        Wrap(
          children: [
            Visibility(
                visible: widget.post.text != "", child: Text(widget.post.text))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              LikeButton(widget.post, userLogId: widget.idLogUser),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PostPage(
                      widget.post,
                      idLogUser: widget.idLogUser,
                    );
                  }));
                },
                icon: Visibility(
                    visible: widget.iconComment,
                    child: const Icon(Icons.comment_bank_outlined)),
                label: const Text(""),
              )
            ],
          ),
        )
      ]),
    );
  }
}
