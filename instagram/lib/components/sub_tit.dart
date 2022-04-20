import 'package:flutter/material.dart';

class SubTit extends StatelessWidget {
  const SubTit(this.testo, {required this.size, Key? key}) : super(key: key);
  final String testo;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(testo,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: size, color: Colors.grey));
  }
}
