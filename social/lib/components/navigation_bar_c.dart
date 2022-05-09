import 'package:flutter/material.dart';

class NavigationBarC extends StatefulWidget {
  const NavigationBarC({Key? key}) : super(key: key);

  @override
  State<NavigationBarC> createState() => _NavigationBarCState();
}

class _NavigationBarCState extends State<NavigationBarC> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "search")
    ]);
  }
}
