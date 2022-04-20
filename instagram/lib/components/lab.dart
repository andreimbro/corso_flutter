import 'package:flutter/material.dart';
import 'package:instagram/components/list_followers.dart';
import 'package:instagram/components/sub_tit.dart';
import 'package:instagram/components/titolo.dart';
import 'package:instagram/models/lab.dart';

class Label extends StatelessWidget {
  const Label(this.listalab, {Key? key}) : super(key: key);
  final List<Lab> listalab;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: listalab.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: listalab[index].page == 1
            ? () {}
            : listalab[index].page == 2
                ? () {}
                : listalab[index].page == 3
                    ? () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: AspectRatio(
                                aspectRatio: 2 / 2, child: ListFollow()),
                          ),
                        )
                    : () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Titolo(listalab[index].num, size: 19),
              SubTit(listalab[index].testo, size: 13),
            ],
          ),
        ),
      ),
    );
  }
}
