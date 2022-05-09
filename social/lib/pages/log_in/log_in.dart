import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/pages/log_in/components/body_login.dart';
import '../home_page/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool logged = false;
  late String userId;
  void inizializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      logged = sp.getString('logKey') != null;
      userId = sp.getString('logKey') ?? "";
    });
  }

  @override
  void initState() {
    inizializeSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return logged ? Home(userId) : const BodyLogIn();
  }
}
