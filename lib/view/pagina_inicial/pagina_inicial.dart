import 'package:flutter/material.dart';
import 'package:reciclagem/view/pagina_inicial/tabs/mapa.dart';
import 'package:reciclagem/view/pagina_inicial/tabs/saiba_mais.dart';
import 'package:reciclagem/view/pagina_inicial/tabs/tela_login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recicla IFB'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_top.png'),
                fit: BoxFit.cover),
          )),
          Container(
              child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navigation()),
              );
            },
          )),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  int _selectedIndex = 0;
  SaibaMais saibaMais = new SaibaMais();
  Mapa mapa = new Mapa();
  Login login = new Login();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Business',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recicla IFB'),
            centerTitle: true,
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
              /*ListTile(
                contentPadding: EdgeInsets.only(top: 563.0),
                title: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Início", style: TextStyle(fontSize: 25)),
                        color: Colors.black,
                        textColor: Colors.white,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("Contato", style: TextStyle(fontSize: 25)),
                        color: Colors.black,
                        textColor: Colors.white,
                      ),
                    )),
                  ],
                ),
              ),*/
            ],
          ),
          /*bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped(_selectedIndex, context),
      ),*/
        ));
  }
}
