import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:viaggi/components/card_c.dart';
import 'package:viaggi/components/end_drawer_c.dart';
import 'package:viaggi/components/search_bar.dart';
import 'package:viaggi/components/tasto_op.dart';
import 'package:viaggi/models/meta_turistica.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;
  late List<MetaTuristica> _find;
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late RangeValues _rating;
  String? _country;
  bool? _disponibile;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _scaffoldKey = GlobalKey();
    _rating = const RangeValues(1, 5);
    _find = MetaTuristica.listaMete;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (ModalRoute.of(context)?.settings.arguments == true) {
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }

  _ricerca({
    RangeValues rating = const RangeValues(1, 5),
    String? country,
    bool? disponibile,
    bool reset = false,
  }) {
    if (reset) {
      _rating = rating;
      _country = country;
      _disponibile = disponibile;
    }
    if (controller.text.isEmpty) {
      setState(() {
        _find = MetaTuristica.listaMete.where((meta) {
          return meta.rating >= _rating.start &&
              meta.rating <= _rating.end &&
              (_country == null || meta.country == _country) &&
              (_disponibile == null ||
                  _disponibile == false ||
                  meta.available == _disponibile);
        }).toList();
      });
    } else if (controller.text.length > 2) {
      setState(() {
        _find = MetaTuristica.listaMete.where((meta) {
          return meta.city
                  .toLowerCase()
                  .contains(controller.text.toLowerCase()) &&
              meta.rating >= _rating.start &&
              meta.rating <= _rating.end &&
              (_country == null || meta.country == _country) &&
              (_disponibile == null ||
                  _disponibile == false ||
                  meta.available == _disponibile);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.blue,
          ),
          actions: const [
            SizedBox(
              width: 0,
            )
          ],
        ),
        endDrawer: EndDrawerC(
            prendiValues: _ricerca,
            countryInit: _country,
            dispInit: _disponibile,
            ratingInit: _rating),
        endDrawerEnableOpenDragGesture: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      controller: controller,
                      callback: _ricerca,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  const TastoOp()
                ],
              ),
              _find.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Nessun Luogo trovato"),
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("Luoghi trovati: ${_find.length}"),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: _find.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                        height: 250,
                                        child: CardC(_find[index]));
                                  })),
                        ],
                      ),
                    )
            ],
          ),
        ));
  }
}
