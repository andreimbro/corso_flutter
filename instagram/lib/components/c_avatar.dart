import 'package:flutter/material.dart';

class Cavatar extends StatelessWidget {
  const Cavatar({required this.size, required this.colorr, Key? key})
      : super(key: key);
  final double size;
  final bool colorr;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: colorr == true
                    ? [Colors.purple, Colors.red, Colors.amber]
                    : [Colors.black12, Colors.black26]),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/1.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
