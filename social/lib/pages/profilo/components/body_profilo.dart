import 'package:flutter/material.dart';
import 'package:social/models/global.dart' as global;

import '../../../models/user.dart';

class BodyProfilo extends StatelessWidget {
  final Future<User> future;
  const BodyProfilo(this.future, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = (snapshot.data as User);
        return SizedBox(
          child: Column(
            children: [
              Center(
                  child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                width: MediaQuery.of(context).size.width,
                child: CircleAvatar(
                  radius: 80,
                  child: CircleAvatar(
                      radius: 74,
                      backgroundImage:
                          NetworkImage(user.picture ?? global.ImangeNotFound)),
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                      ),
                      title: Text("${user.firstName}\t${user.lastName}"),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.mail,
                      ),
                      title: Text(user.email ?? "not found"),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.gps_fixed,
                      ),
                      title: Text(
                          "${user.location?.city},\t${user.location?.country}"),
                    ),
                    ListTile(
                      leading: Icon(
                        user.gender == "female" ? Icons.girl : Icons.boy,
                      ),
                      title: Text(user.gender ?? "not found"),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
