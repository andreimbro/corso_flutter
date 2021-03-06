import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../home_page/home.dart';
import "package:social/models/global.dart" as global;

class LogInCard extends StatefulWidget {
  final User user;
  const LogInCard(this.user, {Key? key}) : super(key: key);

  @override
  State<LogInCard> createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();

        sp.setString('logKey', widget.user.id!);
        String idUser = sp.getString('logKey') ?? "";
        if (!mounted) return;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Home(idUser);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    NetworkImage(widget.user.picture ?? global.imangeNotFound),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.user.firstName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
