import 'package:flutter/material.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(children: <Widget>[
          Text('Deu Certo Mapa'),
        ]),
      ),
    );
  }
}