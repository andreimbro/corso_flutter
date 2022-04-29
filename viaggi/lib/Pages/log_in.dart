import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const TextField(),
          const TextField(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/home");
              },
              child: const Text("LogIn"))
        ],
      ),
    );
  }
}
