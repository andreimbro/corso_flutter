import 'package:flutter/material.dart';
import 'package:social/models/global.dart' as global;
import 'package:social/pages/home_page/components/body_home.dart';
import 'package:social/pages/profilo/components/list_dettagli_profilo.dart';

import '../../../models/user.dart';

class BodyProfilo extends StatelessWidget {
  final Future<User> future;
  final String idLogUser;
  final Function refresh;
  const BodyProfilo(this.future,
      {required this.refresh, required this.idLogUser, Key? key})
      : super(key: key);

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
              ListProfDett(user),
              const Divider(),
              Expanded(
                  child: BodyHome(
                refresh: refresh,
                idLogUser: idLogUser,
                iduser: user.id,
                profilo: true,
              )),
            ],
          ),
        );
      },
    );
  }
}
