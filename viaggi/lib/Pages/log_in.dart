import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _viewpass = true;
  bool logged = false;

  void inizializeSharedPreferences() async {
    SharedPreferences logpref = await SharedPreferences.getInstance();
    setState(() {
      logged = logpref.getBool('logKey') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    inizializeSharedPreferences();
  }

  void view() {
    setState(() {
      _viewpass = !_viewpass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return logged
        ? const Home()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0,
              title: const Text(
                "Login",
                style: TextStyle(color: Colors.blue),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: CircleAvatar(
                    radius: 70,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Inserisci Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Inserisci una email";
                            }
                            if (!value.contains("@") || !value.contains(".")) {
                              return "Inserisci una email valida";
                            }
                            if (value != "ciao@gmail.com") {
                              return "L'email non è presente neldatabase";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: TextFormField(
                          obscureText: _viewpass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Inserisci un Password";
                            } else if (value.length < 4) {
                              return "Password non valida";
                            }
                            if (value != "ciao") {
                              return "Password non corrisponde";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: "Inserisci Passsword ",
                            suffixIcon: IconButton(
                              onPressed: view,
                              icon: Icon(
                                _viewpass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              SharedPreferences logpref =
                                  await SharedPreferences.getInstance();
                              logpref.setBool('logKey', true);
                              Navigator.of(context).popAndPushNamed('/home');
                            }
                          },
                          child: const Text("LogIn"))
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
