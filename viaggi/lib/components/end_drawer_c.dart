import 'package:flutter/material.dart';
import "package:viaggi/models/meta_turistica.dart";

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
  }) prendiValues;
  const EndDrawerC(
      {required this.prendiValues,
      required this.ratingInit,
      required this.countryInit,
      required this.dispInit,
      required this.raccomandatoInit,
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
  @override
  void initState() {
    super.initState();
    _ratingseleziona = widget.ratingInit;
    _countrySeleziona = widget.countryInit;
    _disponibile = widget.dispInit;
    _raccomandato = widget.raccomandatoInit;
    _listaCountry =
        MetaTuristica.listaMete.map((meta) => meta.country).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
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
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Applica'))
            ],
          )
        ],
      ),
    ));
  }
}
