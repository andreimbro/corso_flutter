import 'package:flutter/material.dart';
import 'package:social/components/post_dialog.dart';
import 'package:social/models/post.dart';

class ButtonPostMod extends StatelessWidget {
  final Function callback;
  final Post post;
  const ButtonPostMod(this.callback, this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return PostDialog(
                callback,
                post: post,
              );
            });
      },
      child: const Text("Modifica"),
    );
  }
}
