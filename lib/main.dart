import 'package:flutter/material.dart';
import 'configuration/database.dart';
import 'file:///C:/Users/Eloy/AndroidStudioProjects/reciclagem/lib/view/pagina_inicial/pagina_inicial.dart';
import 'configuration/hexadecimal.dart';

void main(){
  /*
  * Criação e inserção no banco caso haja necessidade
  * */
  // WidgetsFlutterBinding.ensureInitialized();
  // Database con = new Database();
  // con.construcao();

  runApp((MaterialApp(
    theme: ThemeData(
        primaryColor: HexColor("2F80ED"),
        accentColor: HexColor("EDAB2F"),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary)),
    //home: Home(),
    home: Home(),
  )));
}