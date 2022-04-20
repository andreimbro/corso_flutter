import 'package:flutter/material.dart';
import 'package:folder/components/card_grid.dart';
import 'package:folder/components/card_pic.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ciao = false;

  void changeview() {
    setState(() {
      ciao = !ciao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: changeview,
          icon: ciao == false
              ? const Icon(
                  Icons.format_list_bulleted,
                  size: 30,
                )
              : const Icon(
                  Icons.grid_3x3,
                  size: 30,
                ),
        ),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Folder & Projects",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 30,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 8, left: 8, right: 8),
              child: Text(
                "Folders",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: ciao == false
                  ? GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: const [
                        Cardgrid(),
                        Cardgrid(),
                        Cardgrid(),
                        Cardgrid(),
                        Cardgrid(),
                        Cardgrid(),
                      ],
                    )
                  : ListView(
                      children: const [
                        Cardpic(),
                        Cardpic(),
                        Cardpic(),
                        Cardpic(),
                        Cardpic(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
