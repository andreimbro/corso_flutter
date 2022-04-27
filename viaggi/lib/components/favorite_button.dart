import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: IconButton(
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
            icon: favorite
                ? const Icon(
                    Icons.bookmark,
                    color: Colors.black,
                    size: 14,
                  )
                : const Icon(
                    Icons.bookmark_outline,
                    color: Colors.black,
                    size: 14,
                  )));
  }
}
