import 'package:flutter/material.dart';
import 'package:social/api/api_post.dart';
import 'package:social/models/post.dart';

import '../models/user.dart';

class FloaatButtonHome extends StatefulWidget {
  final Function callback;
  const FloaatButtonHome(this.callback, {Key? key}) : super(key: key);

  @override
  State<FloaatButtonHome> createState() => _FloaatButtonHomeState();
}

class _FloaatButtonHomeState extends State<FloaatButtonHome> {
  late Post _post;
  late String? _text;
  late String? _tag;
  late TextEditingController _controllerText;
  late TextEditingController _controllerTag;

  @override
  void initState() {
    _controllerText = TextEditingController();
    _controllerTag = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        var create = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _controllerText,
                      onChanged: (value) {
                        _text = _controllerText.text;
                      },
                    ),
                    Card(
                      child: Image.network(
                          'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg'),
                    ),
                    TextField(
                        controller: _controllerTag,
                        onChanged: (value) {
                          _tag = _controllerTag.text;
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.close)),
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
                              _post = Post(
                                  likes: 0,
                                  owner: provauser,
                                  image:
                                      'https://www.legadelcane.org/wp-content/uploads/puppy-1903313_1920-1080x675.jpg',
                                  text: _text ?? "",
                                  tags: _tag?.split(', ') ?? []);

                              await ApiPost.addPostById(_post);
                              Navigator.of(context).pop(widget.callback(true));
                            },
                            icon: const Icon(Icons.send))
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: Icon(Icons.add),
      elevation: 2.0,
    );
  }
}


//