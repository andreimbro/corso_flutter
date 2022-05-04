import 'package:social/pages/home.dart';
import 'package:social/pages/log_in.dart';

routes() {
  return {
    "/": (context) => const LogIn(),
    "/home": (context) => const Home(),
  };
}
