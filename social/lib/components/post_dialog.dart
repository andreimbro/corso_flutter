import 'package:flutter/material.dart';

import '../api/api_post.dart';
import '../models/post.dart';
import '../models/user.dart';

class PostDialog extends StatefulWidget {
  final Function callback;
  final Post? post;

  const PostDialog(this.callback, {this.post, Key? key}) : super(key: key);

  @override
  State<PostDialog> createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  late Post _post;
  String? _text;
  String? _tag;
  late TextEditingController _controllerText;
  late TextEditingController _controllerTag;

  @override
  void initState() {
    _controllerText = TextEditingController(
        text: widget.post != null ? widget.post!.text : "");
    _controllerTag = TextEditingController(
        text: widget.post != null
            ? widget.post!.tags
                .toString()
                .substring(1, widget.post!.tags.toString().length - 1)
            : "");
    _text = _controllerText.text;
    _tag = _controllerTag.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Crea il tuo Post",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Descrizione",
                hintText: "Inserisci una descrizione",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: _controllerText,
              onChanged: (value) {
                _text = _controllerText.text;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              child: Image.network((widget.post != null)
                  ? widget.post!.image
                  : 'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: "Tag",
                  hintText: "Inserisci i tuoi tag",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: _controllerTag,
                onChanged: (value) {
                  _tag = _controllerTag.text;
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      _text = null;
                      _controllerText.clear();
                      _controllerTag.clear();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close)),
                Visibility(
                  visible: widget.post != null,
                  child: TextButton(
                    onPressed: () async {
                      await ApiPost.deletePost(widget.post?.id ?? "");
                      Navigator.of(context).pop(widget.callback(true));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text(
                      "Ellimina",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      const provauser = User(
                          id: "60d0fe4f5311236168a109ca",
                          title: "ms",
                          firstName: "Sara",
                          lastName: "Andersen",
                          picture:
                              "https://randomuser.me/api/portraits/women/58.jpg",
                          email: "ciao@gmail.com");

                      if (widget.post != null) {
                        final modpost = Post(
                            likes: widget.post!.likes,
                            owner: provauser,
                            image: widget.post!.image,
                            text: _text ?? "",
                            tags: _tag?.split(', ') ?? []);
                        await ApiPost.modPost(modpost, widget.post!.id ?? "");
                      } else {
                        _post = Post(
                            likes: 0,
                            owner: provauser,
                            image:
                                'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg',
                            text: _text ?? "",
                            tags: _tag?.split(' ') ?? []);

                        await ApiPost.addPostById(_post);
                      }
                      Navigator.of(context).pop(widget.callback(true));
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
