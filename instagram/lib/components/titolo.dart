import 'package:flutter/material.dart';

class Titolo extends StatelessWidget {
  const Titolo(this.testo, {required this.size, Key? key}) : super(key: key);
  final String testo;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(testo,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size,
        ));
  }
}
