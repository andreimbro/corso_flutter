import 'package:flutter/material.dart';
import 'package:instagram/components/bio_text.dart';
import 'package:instagram/components/button_c.dart';
import 'package:instagram/components/c_avatar.dart';
import 'package:instagram/components/custom_appbar.dart';
import 'package:instagram/components/lab.dart';
import 'package:instagram/components/navigation_bar.dart';
import 'package:instagram/components/story_avatar.dart';
import 'package:instagram/components/tab_v.dart';
import 'package:instagram/models/lab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Lab> listalab = [
    Lab(num: "136", testo: "Posts", page: 0),
    Lab(num: "16k", testo: "Folowers", page: 1),
    Lab(num: "436", testo: "Followings", page: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBAr(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(), //physics
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                height: 100,
                child: Row(
                  children: [
                    const Cavatar(
                      size: 90,
                      colorr: true,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(child: Label(listalab)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28, bottom: 18),
                child: BioText(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 30,
                child: Row(
                  children: const [
                    Expanded(
                      child: Buttonc(
                        buttonfollow: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
                height: 110,
                child: Row(
                  children: [Expanded(child: StoryAvatar())],
                ),
              ),
              const Expanded(child: TabV()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
