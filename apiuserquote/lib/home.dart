import 'models/users_auotgenerate.dart';
import 'package:flutter/material.dart';

import 'api/api_users.dart';
import 'models/users.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Users> _listOfUsers;
  late bool _hasMoreUsers;
  late int _skipUsers;
  late Future<List<Users>> _future;

  @override
  void initState() {
    super.initState();
    inizializeInitVariables();
  }

  Future<List<Users>> _fetchUsers() async {
    final UserAutoGenerate result =
        await ApiUsers.getUserFromInternet(_skipUsers);

    setState(() {
      _skipUsers = _skipUsers + result.limit;
      _hasMoreUsers = (result.total - _skipUsers > 0);
      _listOfUsers = _listOfUsers + result.users;
    });

    return _listOfUsers;
  }

  void inizializeInitVariables() {
    _listOfUsers = [];
    _hasMoreUsers = false;
    _skipUsers = 0;
    _future = _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Utenti'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () {
            setState(() {
              inizializeInitVariables();
            });
            return Future.value();
          },
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is List<Users>) {
                final listUsers = (snapshot.data as List<Users>);
                return ListView.builder(
                    itemCount: listUsers.length + (_hasMoreUsers ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _listOfUsers.length) {
                        _future = _fetchUsers();

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(listUsers[index].image)),
                              Column(
                                children: [
                                  Text(
                                    'Nome: ${listUsers[index].firstName}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Cognome: ${listUsers[index].lastName}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Anni: ${listUsers[index].age}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
