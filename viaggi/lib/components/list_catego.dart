import 'package:flutter/material.dart';
import 'package:viaggi/models/interessi.dart';

class ListCat extends StatelessWidget {
  final Interessi interessi;
  const ListCat(this.interessi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: interessi.color,
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                interessi.icon,
                color: Colors.white,
              ),
            ),
            Text(
              interessi.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
