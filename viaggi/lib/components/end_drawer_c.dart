import 'package:flutter/material.dart';
import 'package:viaggi/components/list_catego.dart';
import "package:viaggi/models/meta_turistica.dart";

import '../models/interessi.dart';

class EndDrawerC extends StatefulWidget {
  final RangeValues ratingInit;
  final String? countryInit;
  final bool? dispInit;
  final bool? raccomandatoInit;
  final Function({
    RangeValues rating,
    String? country,
    bool? disponibile,
    bool? raccomandato,
    bool reset,
    List<Interessi> categorie,
  }) prendiValues;
  final List<Interessi> categorieSelezionate;

  const EndDrawerC(
      {required this.prendiValues,
      required this.ratingInit,
      required this.countryInit,
      required this.dispInit,
      required this.raccomandatoInit,
      required this.categorieSelezionate,
      Key? key})
      : super(key: key);

  @override
  State<EndDrawerC> createState() => _EndDrawerCState();
}

class _EndDrawerCState extends State<EndDrawerC> {
  late RangeValues _ratingseleziona;
  late String? _countrySeleziona;
  late List<String> _listaCountry;
  late bool? _disponibile;
  late bool? _raccomandato;

  late List<Interessi> _categorieSelezionate;

  @override
  void initState() {
    super.initState();
    _ratingseleziona = widget.ratingInit;
    _countrySeleziona = widget.countryInit;
    _disponibile = widget.dispInit;
    _raccomandato = widget.raccomandatoInit;
    _categorieSelezionate = widget.categorieSelezionate;

    _listaCountry =
        MetaTuristica.listaMete.map((meta) => meta.country).toSet().toList();
  }

  void callbackCategorie(Interessi categorie) {
    setState(() {
      if (_categorieSelezionate.contains(categorie)) {
        _categorieSelezionate.remove(categorie);
      } else {
        _categorieSelezionate.add(categorie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const Text(
              "Filtri",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                          height: 120,
                          child: ListView.builder(
                              itemCount: Interessi.values.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: index != Interessi.values.length - 1
                                        ? const EdgeInsets.only(
                                            right: 20, top: 10, bottom: 10)
                                        : const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                    child: ListCat(
                                      callback: callbackCategorie,
                                      categoriacolor: _categorieSelezionate
                                          .contains(Interessi.values[index]),
                                      interessi: Interessi.values[index],
                                    ));
                              }))),
                  RangeSlider(
                    min: 1,
                    max: 5,
                    values: _ratingseleziona,
                    divisions: 4,
                    onChanged: (RangeValues value) {
                      setState(() {
                        _ratingseleziona = value;
                      });
                    },
                    labels: RangeLabels(
                        _ratingseleziona.start.toString().substring(0, 1),
                        _ratingseleziona.end.toString().substring(0, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String?>(
                        isDense: true,
                        value: _countrySeleziona,
                        items: <DropdownMenuItem<String?>>[
                              const DropdownMenuItem(
                                child: Text('Nessun country selezionato'),
                                value: null,
                              )
                            ] +
                            _listaCountry
                                .map((country) => DropdownMenuItem<String?>(
                                      child: Text(country),
                                      value: country,
                                    ))
                                .toList(),
                        onChanged: (metaSelezionata) {
                          setState(() {
                            _countrySeleziona = metaSelezionata;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Solo Disponibili'),
                      value: _disponibile ?? false,
                      onChanged: (toggle) {
                        setState(() {
                          _disponibile = toggle;
                        });
                      }),
                  SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Raccomandati'),
                      value: _raccomandato ?? false,
                      onChanged: (toggle) {
                        setState(() {
                          _raccomandato = toggle;
                        });
                      }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        _disponibile = null;
                        _countrySeleziona = null;
                        _ratingseleziona = const RangeValues(1, 5);
                        _raccomandato = null;
                      });
                    },
                    child: const Text('Reset')),
                TextButton(
                    onPressed: () {
                      widget.prendiValues(
                        reset: true,
                        country: _countrySeleziona,
                        disponibile: _disponibile,
                        rating: _ratingseleziona,
                        raccomandato: _raccomandato,
                        categorie: _categorieSelezionate,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Applica'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
