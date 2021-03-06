import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/profilo/profilo.dart';

class CustomAppBAr extends StatelessWidget with PreferredSizeWidget {
  final String idLogUser;
  const CustomAppBAr(this.idLogUser, {Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              var iduser = sp.getString('logKey');
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Profilo(
                  iduser ?? "user not found",
                  idLogUser: idLogUser,
                );
              }));
            },
            icon: const Icon(Icons.person))
      ],
    );
  }
}
