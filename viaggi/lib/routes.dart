import 'package:viaggi/Pages/log_in.dart';
import 'package:viaggi/Pages/preferiti_page.dart';
import 'package:viaggi/Pages/search_page.dart';

import 'Pages/home.dart';

getRoutes() {
  return {
    "/": (context) => const LogIn(),
    "/home": (context) => const Home(),
    "/search": (context) => const SearchPage(),
    "/preferiti": (context) => const PreferitiPage(),
  };
}
