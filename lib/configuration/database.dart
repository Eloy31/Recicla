import 'package:postgres/postgres.dart';
import 'package:flutter/services.dart' show rootBundle;

class Database {
  /*
  * Configuração banco para depurar celular
  * ->adb reverse tcp:5432 tcp:5432
  * */
  final conn = PostgreSQLConnection('localhost', 5432, 'recicla', username: 'postgres', password: '');

  /*
  * Configuração banco para depurar com simulador androidStudio
  * */
  // final conn = PostgreSQLConnection('10.0.2.2', 5432, 'recicla', username: 'postgres', password: '');

  void construcao() async {
    await conn.open();
    await conn.query(await rootBundle.loadString('assets/sql/createCooperativa.sql'));
    await conn.query(await rootBundle.loadString('assets/sql/createPontoEntregaVoluntaria.sql'));
    await conn.query(await rootBundle.loadString('assets/sql/createAdministrador.sql'));
    await conn.query(await rootBundle.loadString('assets/sql/insertCooperativa1.sql'));
    await conn.query(await rootBundle.loadString('assets/sql/insertCooperativa2.sql'));
    await conn.close();
  }

  Future openConnection() async {
    await conn.open();
  }

  Future closeConnection() async {
    await conn.close();
  }
}