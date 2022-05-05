import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:viaggi/components/card_c.dart';
import 'package:viaggi/components/favorite_button.dart';
import 'package:viaggi/models/meta_turistica.dart';

class PreferitiPage extends StatelessWidget {
  final StreamingSharedPreferences shareprefe;

  const PreferitiPage(this.shareprefe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MetaTuristica> getMetePreferite(List<String> _preferences) {
      List<MetaTuristica> metePreferite = [];
      for (var meta in MetaTuristica.listaMete) {
        if (_preferences.contains(meta.city)) {
          metePreferite.add(meta);
        }
      }
      return metePreferite;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Preferiti"),
        ),
        body: PreferenceBuilder<List<String>>(
            preference: shareprefe.getStringList("preferiti", defaultValue: []),
            builder: (context, _preferenceResult) {
              List<MetaTuristica> listamete =
                  getMetePreferite(_preferenceResult);
              return ListView.builder(
                  itemCount: listamete.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardC(listamete[index]),
                        FavoriteButton(listamete[index]),
                      ],
                    );
                  });
            }));
  }
}
