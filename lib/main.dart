import 'package:flutter/material.dart';
import 'controller/construtorBancoDados.dart';
import 'file:///C:/Users/Eloy/AndroidStudioProjects/reciclagem/lib/view/pagina_inicial/pagina_inicial.dart';
import 'configuration/hexadecimal.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  ConnectAndConstructorPostgres con = new ConnectAndConstructorPostgres();
  con.construcao();
  /*runApp((MaterialApp(
    theme: ThemeData(
        primaryColor: HexColor("2F80ED"),
        accentColor: HexColor("EDAB2F"),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary)),
    home: Home(),
  )));*/
}