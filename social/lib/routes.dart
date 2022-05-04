import 'package:social/pages/home_page/home.dart';
import 'package:social/pages/log_in/log_in.dart';

routes() {
  return {
    "/": (context) => const LogIn(),
    "/home": (context) => const Home(),
  };
}
