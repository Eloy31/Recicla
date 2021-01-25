class Cooperativa {
  int _id;
  String _identificador;
  String _setorHabitacional;
  String _responsavel;
  String _contato;
  String _cep;
  String _observacao;
  double _latitude;
  double _longitude;

  Cooperativa(
      this._id,
      this._identificador,
      this._setorHabitacional,
      this._responsavel,
      this._contato,
      this._cep,
      this._observacao,
      this._latitude,
      this._longitude);

  /*------------------------------------------*/
  double get longitude => _longitude;
  set longitude(double value) {
    _longitude = value;
  }
  /*------------------------------------------*/
  double get latitude => _latitude;
  set latitude(double value) {
    _latitude = value;
  }
  /*------------------------------------------*/
  String get observacao => _observacao;
  set observacao(String value) {
    _observacao = value;
  }
  /*------------------------------------------*/
  String get cep => _cep;
  set cep(String value) {
    _cep = value;
  }
  /*------------------------------------------*/
  String get contato => _contato;
  set contato(String value) {
    _contato = value;
  }
  /*------------------------------------------*/
  String get responsavel => _responsavel;
  set responsavel(String value) {
    _responsavel = value;
  }
  /*------------------------------------------*/
  String get setorHabitacional => _setorHabitacional;
  set setorHabitacional(String value) {
    _setorHabitacional = value;
  }
  /*------------------------------------------*/
  int get id => _id;
  set id(int value) {
    _id = value;
  }
  /*------------------------------------------*/
  String get identificador => _identificador;
  set identificador(String value) {
    _identificador = value;
  }
  /*------------------------------------------*/

  @override
  String toString() {
    return 'Cooperativa{_identificador: $_identificador, _setorHabitacional: $_setorHabitacional, _responsavel: $_responsavel, _contato: $_contato, _cep: $_cep, _observacao: $_observacao, _latitude: $_latitude, _longitude: $_longitude}';
  }
}