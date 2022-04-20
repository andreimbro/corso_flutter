import 'package:flutter/material.dart';
import 'package:instagram/components/button_c.dart';
import 'package:instagram/components/c_avatar.dart';

class ListFollow extends StatelessWidget {
  ListFollow({Key? key}) : super(key: key);
  final List<String> name = [
    "ciao",
    "idi",
    "3eydgy",
    "iojd",
    "Tfty",
    "iojd",
    "Tfty",
    "iojd",
    "Tfty"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: name.length,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        color: Colors.white,
        child: ListTile(
            title: Text(
              name[index],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            leading: const Cavatar(size: 40, colorr: true),
            trailing: SizedBox(
              height: 20,
              width: 90,
              child: Row(
                children: const [
                  Expanded(child: Buttonc(buttonfollow: true)),
                ],
              ),
            )),
      ),
    );
  }
}
