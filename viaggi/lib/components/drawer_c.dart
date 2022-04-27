import 'package:flutter/material.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(0))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (() {}), icon: const Icon(Icons.close)),
            const DrawerHeader(
              child: Center(
                  child: CircleAvatar(
                maxRadius: 50,
              )),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Homepage'),
            ),
            const ListTile(
              leading: Icon(Icons.style),
              title: Text('Preferiti'),
            ),
            const ListTile(
              leading: Icon(Icons.android),
              title: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
