import 'package:flutter/material.dart';

class Profilo extends StatefulWidget {
  final String iduser;
  const Profilo(this.iduser, {Key? key}) : super(key: key);

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Card(
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(24),
                child: CircleAvatar(
                  radius: 80,
                ),
              )),
              const Divider(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                      ),
                      title: Text("data"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
