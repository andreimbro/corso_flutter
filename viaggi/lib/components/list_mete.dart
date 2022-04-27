import 'package:flutter/material.dart';
import 'package:viaggi/components/card_c.dart';
import 'package:viaggi/models/meta_turistica.dart';

class ListMete extends StatelessWidget {
  final bool raccomanded;
  final bool rating;
  const ListMete({this.raccomanded = false, this.rating = false, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MetaTuristica.listaMete.length,
              itemBuilder: (context, index) =>
                  MetaTuristica.listaMete[index].rating >= 5 && rating
                      ? CardC(MetaTuristica.listaMete[index])
                      : MetaTuristica.listaMete[index].raccomanded &&
                              raccomanded
                          ? CardC(MetaTuristica.listaMete[index])
                          : rating == false && raccomanded == false
                              ? CardC(MetaTuristica.listaMete[index])
                              : const SizedBox(
                                  width: 0,
                                )),
        ),
      ],
    );
  }
}
