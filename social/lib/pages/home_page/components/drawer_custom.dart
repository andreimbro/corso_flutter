import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.remove('logKey');
            if (!mounted) return;
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          }),
    ));
  }
}
