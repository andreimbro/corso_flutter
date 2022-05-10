import 'package:flutter/material.dart';
import 'package:social/components/floatbutton_home.dart';
import 'package:social/components/navigation_bar_c.dart';
import 'package:social/pages/home_page/components/body_home.dart';
import 'package:social/components/custom_appbar.dart';
import 'package:social/pages/home_page/components/drawer_custom.dart';

class Home extends StatefulWidget {
  final String idLogUser;
  const Home(this.idLogUser, {Key? key}) : super(key: key);

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

  int _currentPage = 0;
  var controller = PageController(
    initialPage: -1,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _currentPage = index;
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloaatButtonHome(refresh),
        appBar: CustomAppBAr(
          widget.idLogUser,
        ),
        drawer: const DrawerCustom(),
        body: PageView(
            controller: controller,
            onPageChanged: (index) {
              pageChanged(index);
            },
            children: [
              BodyHome(
                refresh: refresh,
                idLogUser: widget.idLogUser,
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Questa è una pagina di prova",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              )
            ]),
        bottomNavigationBar: NavigationBarC(_currentPage, bottomTapped));
  }
}
