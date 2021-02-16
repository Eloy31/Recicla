import 'package:flutter/material.dart';
import 'file:///C:/Users/Eloy/AndroidStudioProjects/reciclagem/lib/view/navbar/navbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recicla IFB'),
        centerTitle: true,
      ),
      body: Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                color: Colors.amber[600],
                width: 250.0,
                height: 230.0,
                padding: EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    Text(
                      'Seja Bem Vindo,',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Text(
                        'o Recicla IFB tem como objetivo aproximar e informar os usuários sobre aspectos relacionados ao descarte correto de materiais reciclados.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                color: Colors.amber[600],
                width: 250.0,
                height: 230.0,
                padding: EdgeInsets.only(top: 25.0, left: 20, right: 20),
                child: Text(
                  'O Recicla IFB tem em seu menu superior a aba SAIBA MAIS, que possibilita a visualização de informações sobre assuntos relevantes sobre o descarte e coleta seletiva da região do Distrito Federal.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                color: Colors.amber[600],
                width: 250.0,
                height: 150.0,
                padding: EdgeInsets.only(top: 25.0,left: 20, right: 20),
                child: Text(
                  'Já na aba MAPA, lhe direciona para o mapa da região que você se encontra. Possibilitando a manipulação e a criar rotas.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                color: Colors.amber[600],
                width: 250.0,
                height: 170.0,
                padding: EdgeInsets.only(top: 25.0, left: 20, right: 20),
                child: Text(
                  'Nas abas LOGIN, você poderá se cadastrar no nosso sistema e entrar em sua conta para disfrutar de todas as nossas funcionalidades.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
               Container(
                   margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                   color: Colors.transparent,
                   width: 250.0,
                   height: 150.0,
                   padding: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 50),
                    child: ElevatedButton(
                      child: Text(
                          'Começar a utilizar',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25.0,
                          ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => Navigation()),
              );
            },
                ))
            ],
          ),
        ),
    );
  }
}
