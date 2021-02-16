import 'package:flutter/material.dart';

class SaibaMais extends StatefulWidget {
  @override
  _SaibaMaisState createState() => _SaibaMaisState();
}

class _SaibaMaisState extends State<SaibaMais> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(children: <Widget>[
          Text('Deu Certo Saiba mais'),
        ]),
      ),
    );
  }
}
