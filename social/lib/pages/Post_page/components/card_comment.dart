import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social/api/api_comment.dart';
import 'package:social/models/comment.dart';
import 'package:social/models/global.dart' as global;

class CardComment extends StatefulWidget {
  final Comment comment;
  final String idLogUser;
  final String idUserPost;
  const CardComment(this.comment,
      {required this.idLogUser, required this.idUserPost, Key? key})
      : super(key: key);

  @override
  State<CardComment> createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  late bool delete;
  @override
  void initState() {
    delete = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !delete,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  widget.comment.owner.picture ?? global.imangeNotFound,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.comment.owner.firstName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      if (widget.comment.publishDate != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            DateFormat.yMMMMd('it_IT').add_Hm().format(
                                  DateTime.parse(widget.comment.publishDate!),
                                ),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.comment.message),
                      IconButton(
                          onPressed: () async {
                            final cancella = await ApiComment.deleteComment(
                                widget.comment.id!);
                            setState(() {
                              delete = cancella;
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            size:
                                (widget.comment.owner.id == widget.idLogUser ||
                                        widget.idUserPost == widget.idLogUser)
                                    ? 20
                                    : 0,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
