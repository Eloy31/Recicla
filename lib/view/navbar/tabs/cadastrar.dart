import 'package:flutter/material.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(children: <Widget>[
          Text('Deu Certo Cadastrar'),
        ]),
      ),
    );
  }
}
