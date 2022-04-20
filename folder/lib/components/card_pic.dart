import 'package:flutter/material.dart';

class Cardpic extends StatelessWidget {
  const Cardpic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: const Text(
          'Folder',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.topic_outlined,
              color: Theme.of(context).primaryColor, size: 40),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
