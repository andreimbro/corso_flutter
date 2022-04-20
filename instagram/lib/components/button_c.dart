import 'package:flutter/material.dart';
import 'package:instagram/models/button_class.dart';

class Buttonc extends StatefulWidget {
  const Buttonc({required this.buttonfollow, Key? key}) : super(key: key);
  final bool buttonfollow;

  @override
  State<Buttonc> createState() => _ButtoncState();
}

class _ButtoncState extends State<Buttonc> {
  bool follow = false;
  String followed = "Followed";

  final List<Buttonclass> titlebutton = [
    Buttonclass(title: "Following", icon: true),
    Buttonclass(title: "Message", icon: false),
    Buttonclass(title: "Contact", icon: false),
    Buttonclass(icon: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.buttonfollow == false ? titlebutton.length : 1,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: index == 0
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 600),
                        backgroundColor: Colors.white,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          follow == false ? 'Followed' : "Unfolowed",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                    setState(() {
                      follow = !follow;
                    });
                  }
                : () {},
            child: Container(
                margin: widget.buttonfollow == false
                    ? const EdgeInsets.symmetric(horizontal: 6)
                    : const EdgeInsets.all(0),
                width: titlebutton[index].title == null ? 30 : 90,
                decoration: BoxDecoration(
                    color: index == 0 && follow == false
                        ? Colors.blue
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (titlebutton[index].title != null)
                      Text(
                        follow == false
                            ? titlebutton[index].title!
                            : index == 0
                                ? followed
                                : titlebutton[index].title!,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: index == 0 && follow == false
                                ? Colors.white
                                : Colors.black87),
                      ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: index == 0 && follow == false
                          ? Colors.white
                          : Colors.black,
                      size: titlebutton[index].icon == true &&
                              widget.buttonfollow == false
                          ? 20
                          : 0,
                    )
                  ],
                )));
      },
    );
  }
}
