import 'package:flutter/material.dart';

class AppBarC extends StatelessWidget
    with PreferredSizeWidget /*Non ti scordare il  mixin per fare override */ {
  const AppBarC({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.grey),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.pin_drop,
            color: Colors.blue,
          ),
          Text(
            'Italia',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(),
        )
      ],
    );
  }
}
