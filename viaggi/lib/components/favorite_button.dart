import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viaggi/models/meta_turistica.dart';

class FavoriteButton extends StatefulWidget {
  final MetaTuristica metaTuristica;

  const FavoriteButton(this.metaTuristica, {Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;

  void initsharepref() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    final _pref = shareprefe.getStringList("preferiti") ?? [];
    setState(() {
      favorite = _pref.contains(widget.metaTuristica.city);
    });
  }

  @override
  void initState() {
    super.initState();
    initsharepref();
  }

  void aggiungipreferiti() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    var _newpref = shareprefe.getStringList("preferiti") ?? [];
    _newpref.add(widget.metaTuristica.city);
    await shareprefe.setStringList("preferiti", _newpref);
  }

  void rimuovipreferiti() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    var _pref = shareprefe.getStringList("preferiti") ?? [];
    _pref.remove(widget.metaTuristica.city);
    await shareprefe.setStringList("preferiti", _pref);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: IconButton(
            onPressed: () {
              favorite == false ? aggiungipreferiti() : rimuovipreferiti();

              setState(() {
                favorite = !favorite;
              });
            },
            icon: favorite
                ? const Icon(
                    Icons.bookmark,
                    color: Colors.black,
                    size: 14,
                  )
                : const Icon(
                    Icons.bookmark_outline,
                    color: Colors.black,
                    size: 14,
                  )));
  }
}
