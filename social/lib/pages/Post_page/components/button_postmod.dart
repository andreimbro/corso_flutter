import 'package:flutter/material.dart';
import 'package:social/api/api_post.dart';
import 'package:social/models/post.dart';

import '../../../models/user.dart';

class ButtonPostMod extends StatefulWidget {
  final Post post;
  const ButtonPostMod(this.post, {Key? key}) : super(key: key);

  @override
  State<ButtonPostMod> createState() => _ButtonPostModState();
}

class _ButtonPostModState extends State<ButtonPostMod> {
  String? _text;
  String? _tag;
  late TextEditingController _controllerText;
  late TextEditingController _controllerTag;

  @override
  void initState() {
    _controllerText = TextEditingController(text: widget.post.text);
    _controllerTag = TextEditingController(
        text: widget.post.tags
            .toString()
            .substring(1, widget.post.tags.toString().length - 1));
    _text = _controllerText.text;
    _tag = _controllerTag.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        var create = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
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
                        child: Image.network(
                          widget.post.image,
                        ),
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
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close)),
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
                                final modpost = Post(
                                    likes: widget.post.likes,
                                    owner: provauser,
                                    image: widget.post.image,
                                    text: _text ?? "",
                                    tags: _tag?.split(', ') ?? []);
                                ApiPost.modPost(modpost, widget.post.id ?? "");
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.send))
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: const Text("Modifica"),
    );
  }
}


//