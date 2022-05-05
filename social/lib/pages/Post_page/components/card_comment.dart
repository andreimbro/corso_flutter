import 'package:flutter/material.dart';
import 'package:social/models/comment.dart';
import 'package:social/models/global.dart' as global;

class CardComment extends StatelessWidget {
  final Comment comment;
  const CardComment(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                comment.owner.picture ?? global.ImangeNotFound,
              ),
            ),
            title: Text(comment.owner.firstName),
          ),
          Text(comment.message),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
