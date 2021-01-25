class PontoEntregaVoluntaria {
  int _id;
  String identificador;
  String _setorHabitacional;
  String _pontoReferencia;
  String _imagem;
  String _observacao;
  String _status;
  double _latitude;
  double _longitude;

  PontoEntregaVoluntaria(
      this._id,
      this.identificador,
      this._setorHabitacional,
      this._pontoReferencia,
      this._imagem,
      this._observacao,
      this._status,
      this._latitude,
      this._longitude);

  /*------------------------------------*/
  int get id => _id;
  set id(int value) {
    _id = value;
  }
  /*------------------------------------*/
  String get status => _status;
  set status(String value) {
    _status = value;
  }
  /*------------------------------------*/
  String get observacao => _observacao;
  set observacao(String value) {
    _observacao = value;
  }
  /*------------------------------------*/
  String get imagem => _imagem;
  set imagem(String value) {
    _imagem = value;
  }
  /*------------------------------------*/
  String get pontoReferencia => _pontoReferencia;
  set pontoReferencia(String value) {
    _pontoReferencia = value;
  }
  /*------------------------------------*/
  String get setorHabitacional => _setorHabitacional;
  set setorHabitacional(String value) {
    _setorHabitacional = value;
  }

  double get latitude => _latitude;
  set latitude(double value) {
    _latitude = value;
  }
  /*------------------------------------*/
  double get longitude => _longitude;
  set longitude(double value) {
    _longitude = value;
  }
  /*------------------------------------*/

  @override
  String toString() {
    return 'PontoEntregaVoluntaria{identificador: $identificador, SetorHabitacional: $_setorHabitacional, PontoReferencia: $_pontoReferencia, Imagem: $_imagem, Observacao: $_observacao, Status: $_status, Latitude: $latitude, Longitude: $longitude}';
  }
}