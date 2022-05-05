import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social/models/comment.dart';
import 'package:social/models/global.dart' as global;

class CardComment extends StatelessWidget {
  final Comment comment;
  const CardComment(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                comment.owner.picture ?? global.ImangeNotFound,
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
                    Text(
                      comment.owner.firstName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        DateFormat.yMMMMd('it_IT').add_Hm().format(
                              DateTime.parse(comment.publishDate!),
                            ),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(comment.message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
