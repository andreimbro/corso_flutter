import 'package:flutter/material.dart';

class Cardgrid extends StatelessWidget {
  const Cardgrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Card(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.2),
                  //         spreadRadius: 1,
                  //         blurRadius: 5,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(31, 185, 185, 185),
                        shape: BoxShape.circle),
                  ),
                  Icon(Icons.topic_outlined,
                      color: Theme.of(context).primaryColor, size: 40),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Permanent Task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "10 Task",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color.fromARGB(255, 129, 129, 129)),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
  }
}
