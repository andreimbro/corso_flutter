import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool home;
  final TextEditingController? controller;
  final Function? callback;
  const SearchBar({this.controller, this.callback, this.home = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller,
              autofocus: home ? false : true,
              onTap: () {
                if (home) Navigator.of(context).pushNamed('/search');
              },
              onChanged: (value) {
                if (callback != null) callback!();
              },
              readOnly: home,
              decoration: const InputDecoration(
                  hintText: "Search", border: InputBorder.none),
            ),
          )),
          const Icon(
            Icons.search,
            color: Colors.black45,
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}
