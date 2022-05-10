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
    _commento = TextEditingController().text;
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
            elevation: 5,
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Inserisci un commento",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          controller: _controller,
                          onChanged: (value) {
                            _commento = _controller.text;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
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
                                if (_commento!.isEmpty || _commento == null) {
                                  Navigator.of(context).pop();
                                } else {
                                  await ApiComment.addCommentTo(
                                      widget.postId, _commento!);
                                  if (!mounted) return;
                                  Navigator.of(context)
                                      .pop(widget.callback(true));
                                }
                              },
                              icon: const Icon(Icons.send)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ));
      },
    );
  }
}
