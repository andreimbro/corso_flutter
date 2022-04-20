import 'package:flutter/material.dart';
import 'package:project1/components/card_list.dart';

import 'components/card_min.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Hi Jane",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Let's check your activity",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: 240,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "💪 Finished",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: const [
                                  Text(
                                    "20",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Completed\nWorkouts",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Cardmin(
                            titolo: "🐣 In Progress",
                            num: 2,
                            tit2: "Workouts",
                          ),
                          Cardmin(
                            titolo: "🕚 Time Spent",
                            num: 62,
                            tit2: "Minutes",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                width: double.infinity,
                child: const Text(
                  "Discover New Workout",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),

            //slider cardio
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // shrinkWrap:
                //     true, //utilizza spazio dei filgi max come mainAxiSize.min

                children: const [
                  Cardlist(),
                  Cardlist(),
                ],
              ),
            ),

            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "🎉",
                        style: TextStyle(fontSize: 35),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Keep the progress",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("You are more succesfull that\n88% user"),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
