import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:viaggi/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StreamingSharedPreferences shareprefe =
      await StreamingSharedPreferences.instance;

  runApp(MyApp(shareprefe));
}

class MyApp extends StatelessWidget {
  final StreamingSharedPreferences shareprefe;

  const MyApp(this.shareprefe, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: getRoutes(shareprefe),
    );
  }
}
