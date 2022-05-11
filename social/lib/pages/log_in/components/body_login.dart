import 'package:flutter/material.dart';
import 'package:social/pages/log_in/components/login_card.dart';

import '../../../models/global.dart' as global;

class BodyLogIn extends StatelessWidget {
  const BodyLogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("LogIn"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(180),
                    bottomRight: Radius.circular(180))),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: RichText(
                text: const TextSpan(
                  text: "Benvenuto!\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color.fromARGB(255, 32, 61, 156)),
                  children: [
                    TextSpan(
                        text: "Seleziona l'Utente con cui vuoi accedere",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Color.fromARGB(255, 47, 75, 165)))
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Center(
            child: SizedBox(
              height: 200,
              width: 320,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: global.user.length,
                        itemBuilder: (context, index) =>
                            LogInCard(global.user[index])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
