import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/components/floatbutton_home.dart';
import 'package:social/components/navigation_bar_c.dart';
import 'package:social/pages/home_page/components/body_home.dart';
import 'package:social/components/custom_appbar.dart';
import 'package:social/pages/home_page/components/drawer_custom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UniqueKey _key;
  @override
  void initState() {
    _key = UniqueKey();
    super.initState();
  }

  void refresh(bool pop) {
    if (pop == true) {
      setState(() {
        _key = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloaatButtonHome(refresh),
        appBar: CustomAppBAr(),
        drawer: DrawerCustom(),
        body: BodyHome(),
        bottomNavigationBar: NavigationBarC());
  }
}
