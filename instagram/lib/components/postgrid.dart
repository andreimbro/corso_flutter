import 'package:flutter/material.dart';

import '../models/post.dart';

class PostGrid extends StatelessWidget {
  PostGrid({Key? key}) : super(key: key);
  final List<Post> listapost = [
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 1),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 2),
    Post(percorso: "assets/1.jpg", tipo: 1),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 2),
    Post(percorso: "assets/1.jpg", tipo: 1),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 1),
    Post(percorso: "assets/1.jpg", tipo: 1),
    Post(percorso: "assets/1.jpg", tipo: 0),
    Post(percorso: "assets/1.jpg", tipo: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(), //physics
      itemCount: listapost.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              listapost[index].percorso,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: listapost[index].tipo == 1
                  ? const Icon(
                      Icons.play_arrow,
                      color: Colors.white38,
                    )
                  : listapost[index].tipo == 2
                      ? const Icon(
                          Icons.filter,
                          color: Colors.white38,
                        )
                      : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
