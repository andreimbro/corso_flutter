import 'package:flutter/material.dart';

import 'package:social/components/post_dialog.dart';

class FloaatButtonHome extends StatefulWidget {
  final Function callback;
  const FloaatButtonHome(this.callback, {Key? key}) : super(key: key);

  @override
  State<FloaatButtonHome> createState() => _FloaatButtonHomeState();
}

class _FloaatButtonHomeState extends State<FloaatButtonHome> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        var create = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return PostDialog(widget.callback);
            });
      },
      elevation: 2.0,
      child: const Icon(Icons.add),
    );
  }
}


//