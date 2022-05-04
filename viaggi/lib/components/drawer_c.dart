import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.close)),
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
            ListTile(
              leading: const Icon(Icons.style),
              title: const Text('Preferiti'),
              onTap: () => Navigator.of(context).popAndPushNamed("/preferiti"),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences logpref =
                    await SharedPreferences.getInstance();
                logpref.setBool('logKey', false);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
