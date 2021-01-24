import 'package:reciclagem/model/usuario/user.dart';

class Administrador extends User {
  String _codigoAdministrador;

  Administrador(this._codigoAdministrador, String nome, String email, String senha, int id) : super(nome, email, senha, id);

  String get codigoAdministrador => _codigoAdministrador;

  set codigoAdministrador(String value) {
    _codigoAdministrador = value;
  }

  @override
  String toString() {
    return 'Administrador{_codigoAdministrador: $_codigoAdministrador}';
  }
}