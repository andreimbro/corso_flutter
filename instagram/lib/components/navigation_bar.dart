import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedIconTheme: const IconThemeData(color: Colors.black87),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.other_houses_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
              ),
              icon: Icon(
                Icons.person_outline,
              ),
              label: ""),
        ]);
  }
}
