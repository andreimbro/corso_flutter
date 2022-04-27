import 'package:flutter/material.dart';
import 'package:instagram/components/postgrid.dart';

class TabV extends StatelessWidget {
  const TabV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 0.4, color: Colors.black12),
              bottom: BorderSide(width: 0.5, color: Colors.black12),
            )),
            child: const TabBar(
              physics: ClampingScrollPhysics(), //physics
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Color.fromRGBO(158, 158, 158, 1),
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.smart_display_outlined)),
                Tab(icon: Icon(Icons.bookmark_border)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const ClampingScrollPhysics(), //physics
              children: [
                PostGrid(),
                PostGrid(),
                PostGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
