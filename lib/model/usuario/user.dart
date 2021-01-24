class User {
  int _id;
  String _nome;
  String _email;
  String _senha;

  User(this._nome, this._email, this._senha, this._id);

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'User{_nome: $_nome, _email: $_email, _senha: $_senha}';
  }
}