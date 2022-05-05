import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> _preferiti = [];

  void initFavorites() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    setState(() {
      _preferiti = shareprefe.getStringList('pizza') ?? [];
    });
  }

  void addFavorite(String id) async {
    setState(() {
      _preferiti.add(id);
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('pizza', _preferiti);
  }

  void removeFavorite(String id) async {
    setState(() {
      _preferiti.remove(id);
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('pizza', _preferiti);
  }

  @override
  void initState() {
    initFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: Pizza.listaPizze.length,
          itemBuilder: (context, index) {
            var pizza = Pizza.listaPizze[index];
            return ListTile(
              title: Text(pizza.nome),
              trailing: IconButton(
                icon: _preferiti.contains(pizza.id)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  _preferiti.contains(pizza.id)
                      ? removeFavorite(pizza.id)
                      : addFavorite(pizza.id);
                },
              ),
            );
          }),
    );
  }
}
