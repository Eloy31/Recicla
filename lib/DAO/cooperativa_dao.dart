import 'package:reciclagem/configuration/database.dart';
import 'package:reciclagem/model/cooperativa.dart';

class CooperativaDao {
  Database db = new Database();

  Future<List<Cooperativa>> findAll() async {

    await db.openConnection();
    List<Cooperativa> cooperativas = new List();
    try{
      final result = await db.conn.mappedResultsQuery('SELECT id, identificador, setor_habitacional, responsavel, contato, cep, observacao, latitude, longitude FROM "cooperativa"');
      db.closeConnection();

      for (final row in result) {
        Cooperativa cooperativa = new Cooperativa(
            row['cooperativa']['id'],
            row['cooperativa']['identificador'],
            row['cooperativa']['setor_habitacional'],
            row['cooperativa']['responsavel'],
            row['cooperativa']['contato'],
            row['cooperativa']['cep'],
            row['cooperativa']['observacao'],
            row['cooperativa']['latitude'],
            row['cooperativa']['longitude']
        );
        cooperativas.add(cooperativa);
      }
      return cooperativas;
    }on Exception catch (e) {
      print(e);
      return cooperativas;
    }
  }
}