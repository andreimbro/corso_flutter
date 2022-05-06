import 'package:flutter/material.dart';
import 'package:social/api/api_comment.dart';

class FloatButtonC extends StatefulWidget {
  final String postId;
  final Function callback;
  const FloatButtonC({required this.callback, required this.postId, Key? key})
      : super(key: key);

  @override
  State<FloatButtonC> createState() => _FloatButtonCState();
}

class _FloatButtonCState extends State<FloatButtonC> {
  late TextEditingController _controller;
  late String? _commento;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          controller: _controller,
                          onChanged: (value) {
                            _commento = _controller.text;
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                _commento = null;
                                _controller.clear();
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close)),
                          IconButton(
                              onPressed: () async {
                                if (_commento == null || _commento!.isEmpty) {
                                  Navigator.of(context).pop();
                                } else {
                                  ApiComment.addCommentTo(
                                      widget.postId, _commento!);
                                  Navigator.of(context)
                                      .pop(widget.callback(true));
                                }
                              },
                              icon: const Icon(Icons.send)),
                        ],
                      )
                    ],
                  ),
                ));
      },
    );
  }
}
