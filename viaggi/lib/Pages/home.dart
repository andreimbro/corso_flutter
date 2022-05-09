import 'package:flutter/material.dart';
import 'package:viaggi/components/custom_appbar.dart';
import 'package:viaggi/components/drawer_c.dart';
import 'package:viaggi/components/list_mete.dart';
import 'package:viaggi/components/search_bar.dart';
import 'package:viaggi/components/tasto_op.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarC(),
      drawer: const DrawerC(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: SearchBar(
                        home: true,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    TastoOp(
                      home: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Popular Place',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 240,
                  child: ListMete(raccomanded: true),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Recommended',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 240,
                  child: ListMete(
                    rating: true,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
