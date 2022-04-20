import 'package:flutter/material.dart';

class CustomAppBAr extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBAr({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(
      60); //per esportare l Appbar si deve definire size con mixin PreferredSizeWidget

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Loremlpsum",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ))
      ],
    );
  }
}
