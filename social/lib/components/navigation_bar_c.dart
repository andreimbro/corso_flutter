import 'package:flutter/material.dart';

class NavigationBarC extends StatelessWidget {
  final currentPage;
  final Function bottomTapped;
  const NavigationBarC(this.currentPage, this.bottomTapped, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          bottomTapped(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search")
        ]);
  }
}
