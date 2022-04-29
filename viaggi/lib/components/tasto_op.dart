import 'package:flutter/material.dart';

class TastoOp extends StatelessWidget {
  final bool home;

  const TastoOp({this.home = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (home) {
          Navigator.of(context).pushNamed("/search", arguments: true);
        } else {
          Scaffold.of(context).openEndDrawer();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(11.5),
        child: const Icon(
          Icons.menu,
          color: Colors.blueAccent,
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 230, 247),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
