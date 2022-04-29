import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viaggi/Pages/home.dart';
import 'package:viaggi/Pages/log_in.dart';

class ControllLog extends StatefulWidget {
  const ControllLog({Key? key}) : super(key: key);

  @override
  State<ControllLog> createState() => _ControllLogState();
}

class _ControllLogState extends State<ControllLog> {
  bool log = false;

  void inizializeSHarePreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      log = sp.getBool("log") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return log ? const Home() : LogIn();
  }
}
