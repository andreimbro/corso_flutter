import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:viaggi/Pages/preferiti_page.dart';
import 'package:viaggi/Pages/search_page.dart';

import 'Pages/home.dart';
import 'Pages/log_in.dart';

getRoutes(StreamingSharedPreferences shareprefe) {
  return {
    "/": (context) => const LogIn(),
    "/home": (context) => const Home(),
    "/search": (context) => const SearchPage(),
    "/preferiti": (context) => PreferitiPage(shareprefe),
  };
}
