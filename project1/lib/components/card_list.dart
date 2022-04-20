import 'package:flutter/material.dart';

class Cardlist extends StatelessWidget {
  const Cardlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      // shadowColor: Colors.transparent,
      color: Colors.amber,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Cardio",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "10 exercises",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "10 exercises",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Image.asset(
              "assets/cardio.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
