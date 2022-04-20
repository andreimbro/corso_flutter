import 'package:flutter/material.dart';
import 'package:instagram/components/sub_tit.dart';
import 'package:instagram/components/titolo.dart';

class BioText extends StatelessWidget {
  const BioText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Titolo("Lorem lpsum", size: 16),
        const SubTit("Lorem", size: 12),
        const Text(
          "Lorem lpsum....",
          style: TextStyle(
              color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const Text(
          "remips.com",
          style: TextStyle(
              color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        RichText(
          text: const TextSpan(
              text: "rem lpsrem by\t",
              style: TextStyle(color: Colors.black54, fontSize: 12),
              children: [
                TextSpan(
                  text: "user,\t",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: "user2,\t",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black),
                ),
                TextSpan(
                  text: "user3",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ]),
        ),
      ],
    );
  }
}
