import 'package:flutter/material.dart';

class PreferitiPage extends StatelessWidget {
  const PreferitiPage({ Key? key }) : super(key: key);

 bool favorite = false;

  List<MetaTuristica> getMete(List <String>_preferences) {
      List<MetaTuristica> listamete = [];
      MetaTuristica.listaMete.forEach((meta) {
        if (_pref.contains(meta.city)) {
          listamete.add(meta);
        }
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PreferenceBuilder<List<String>>(
          preference: shareprefe.getStringList("preferiti",defaultValue: []) ,
          builder: ,)
        
        //ListView.builder(
        //     itemCount: listamete.length,
        //     itemBuilder: (context, index) {
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           CardC(listamete[index]),
        //           FavoriteButton(listamete[index]),
        //         ],
        //       );
        //     }));

  }
}