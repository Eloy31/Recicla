import 'package:flutter/material.dart';
import 'package:reciclagem/configuration/hexadecimal.dart';
import 'package:reciclagem/view/navbar/tabs/mapa.dart';
import 'package:reciclagem/view/navbar/tabs/saiba_mais.dart';
import 'package:reciclagem/view/navbar/tabs/tela_login.dart';

class Navigation extends StatelessWidget {
  SaibaMais saibaMais = new SaibaMais();
  Mapa mapa = new Mapa();
  Login login = new Login();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recicla IFB'),
            centerTitle: true,
            backgroundColor: HexColor("008251"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.article_outlined), text: 'Saiba Mais'),
                Tab(
                  icon: Icon(Icons.map_outlined),
                  text: 'Mapa',
                ),
                Tab(icon: Icon(Icons.login), text: 'Entrar'),
              ],
            ),
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  saibaMais,
                  mapa,
                  login,
                ],
              ),
            ],
          ),
        ));
  }
}