import 'package:flutter/material.dart';
import 'package:reciclagem/view/pagina_inicial.dart';
import 'configuration/hexadecimal.dart';

void main(){
  runApp((MaterialApp(
    theme: ThemeData(
        primaryColor: HexColor("2F80ED"),
        accentColor: HexColor("EDAB2F"),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary)),
    home: Home(),
  )));
}