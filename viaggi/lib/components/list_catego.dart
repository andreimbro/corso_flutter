import 'package:flutter/material.dart';
import 'package:viaggi/models/interessi.dart';

class ListCat extends StatelessWidget {
  const ListCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
            itemCount: Interessi.values.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: index != Interessi.values.length - 1
                    ? const EdgeInsets.only(right: 20, top: 10, bottom: 10)
                    : const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Interessi.values[index].color,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Interessi.values[index].icon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      Interessi.values[index].name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
