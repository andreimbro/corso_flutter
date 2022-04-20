import 'package:flutter/material.dart';
import 'package:instagram/components/c_avatar.dart';

class StoryAvatar extends StatelessWidget {
  StoryAvatar({Key? key}) : super(key: key);
  final List<String> story = [
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
      itemCount: story.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Cavatar(
              size: 62,
              colorr: false,
            ),
            const SizedBox(height: 4),
            Text(
              story[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
