import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viaggi/components/card_c.dart';
import 'package:viaggi/components/favorite_button.dart';
import 'package:viaggi/models/meta_turistica.dart';

class PreferitiPage extends StatefulWidget {
  const PreferitiPage({Key? key}) : super(key: key);

  @override
  State<PreferitiPage> createState() => _PreferitiPageState();
}

class _PreferitiPageState extends State<PreferitiPage> {
  bool favorite = false;
  List<MetaTuristica> listamete = [];

  void initsharepref() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    final _pref = shareprefe.getStringList("preferiti") ?? [];
    setState(() {
      MetaTuristica.listaMete.forEach((meta) {
        if (_pref.contains(meta.city)) {
          listamete.add(meta);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initsharepref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: listamete.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardC(listamete[index]),
                  FavoriteButton(listamete[index]),
                ],
              );
            }));
  }
}
