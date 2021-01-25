import 'package:reciclagem/DAO/cooperativa_dao.dart';
import 'package:reciclagem/model/cooperativa.dart';

class CooperativaController {
  CooperativaDao cooperativaDao = new CooperativaDao();
  Future<List<Cooperativa>> findAll() async{
    List<Cooperativa> cooperativas = await cooperativaDao.findAll();
    return cooperativas;
  }
}