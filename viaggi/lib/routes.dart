import 'package:viaggi/Pages/search_page.dart';

import 'Pages/home.dart';

getRoutes() {
  return {
    "/": (context) => const Home(),
    "/search": (context) => const SearchPage(),
  };
}
