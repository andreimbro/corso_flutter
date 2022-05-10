import 'package:flutter/material.dart';
import 'package:social/pages/profilo/components/body_profilo.dart';

import '../../api/api_users.dart';
import '../../models/user.dart';

class Profilo extends StatefulWidget {
  final String iduser;
  final String idLogUser;
  const Profilo(this.iduser, {required this.idLogUser, Key? key})
      : super(key: key);

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  late Future<User> _future;
  late UniqueKey _key;

  Future<User> _fetchUser(String id) async {
    return ApiUser.getDetails(id);
  }

  void initvariabili() {
    _key = UniqueKey();
    _future = _fetchUser(widget.iduser);
  }

  void refresh(bool pop) {
    if (pop == true) {
      setState(() {
        _key = UniqueKey();
      });
    }
  }

  @override
  void initState() {
    initvariabili();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          elevation: 0,
        ),
        body: BodyProfilo(
          _future,
          refresh: refresh,
          idLogUser: widget.idLogUser,
        ));
  }
}
