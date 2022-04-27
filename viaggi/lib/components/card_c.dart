import 'package:flutter/material.dart';
import 'package:viaggi/Pages/dettagli.dart';
import 'package:viaggi/models/meta_turistica.dart';

class CardC extends StatelessWidget {
  final MetaTuristica metaturistica;
  const CardC(this.metaturistica, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return Dettagli(metaturistica);
        }),
      ),
      child: Card(
        elevation: 10,
        shadowColor: Colors.white38,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  metaturistica.imageUrl,
                  fit: BoxFit.cover,
                  width: 130,
                  height: 120,
                ),
              ),
            ),
            Text(
              metaturistica.city,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pin_drop,
                  size: 10,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  metaturistica.country,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
