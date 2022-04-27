import 'package:flutter/material.dart';
import 'package:viaggi/components/favorite_button.dart';
import 'package:viaggi/models/meta_turistica.dart';

class Dettagli extends StatelessWidget {
  final MetaTuristica metaTuristica;
  const Dettagli(this.metaTuristica, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 14,
                  ))),
        ),
        actions: const [
          Padding(padding: EdgeInsets.all(4.0), child: FavoriteButton()),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    color: const Color.fromRGBO(0, 0, 0, 0),
                    height: 780,
                  ),
                  SizedBox(
                    height: 380,
                    child: Image.network(
                      metaTuristica.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 230,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Great Place to visit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(metaTuristica.description)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    bottom: 500,
                    left: 60,
                    right: 60,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  metaTuristica.city,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.pin_drop,
                                          color: Colors.blue,
                                          size: 14,
                                        ),
                                        Text(metaTuristica.country,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Text(metaTuristica.rating.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 4),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "€ ${metaTuristica.minPrice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Total Cost",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Prenota",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
