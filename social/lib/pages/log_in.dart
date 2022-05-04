import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/models/user.dart';
import 'home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool logged = false;
  List<User> user = const [
    User(
        id: "60d0fe4f5311236168a109ca",
        title: "ms",
        firstName: "Sara",
        lastName: "Andersen",
        picture: "https://randomuser.me/api/portraits/women/58.jpg",
        email: "ciao@gmail.com"),
    User(
        id: "60d0fe4f5311236168a109cb",
        title: "miss",
        firstName: "Edita",
        lastName: "Vestering",
        picture: "https://randomuser.me/api/portraits/med/women/89.jpg",
        email: "ciao@gmail.com")
  ];

  void inizializeSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      logged = sp.getString('logKey') == "";
    });
  }

  @override
  void initState() {
    super.initState();
    inizializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return logged
        ? const Home()
        : Scaffold(
            appBar: AppBar(),
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: user.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                sp.setString('logKey', user[index].id!);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Home();
                                }));
                              },
                              child: Card(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: user[index].picture != null
                                        ? NetworkImage(user[index].picture!)
                                        : const NetworkImage(
                                            "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image"),
                                  ),
                                  Text(user[index].firstName),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
