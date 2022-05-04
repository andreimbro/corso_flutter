import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Profilo extends StatefulWidget {
  final String iduser;
  const Profilo(this.iduser, {Key? key}) : super(key: key);

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      widget.iduser,
    ));
  }
}
