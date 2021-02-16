import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o nome";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
            child: Container(
                padding: EdgeInsets.only(top: 25.0),
                color: Colors.transparent,
                width: 400.0,
                height: 550.0,
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                            controller: _tLogin,
                            validator: _validateLogin,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                                hintText: "Informe a senha")),
                        TextFormField(
                            controller: _tSenha,
                            validator: _validateSenha,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Senha",
                                labelStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                                hintText: "Informe a senha")),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 40.0,
                          margin: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text("Entrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                            onPressed: () {
                              _onClickLogin(context);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Container(
                          height: 40.0,
                          margin: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text("Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                            onPressed: () {
                              _openPopup(context);
                            },
                          ),
                        ),
                      ],
                    ))),
          ),
        ));
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "Cadastro",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Nome',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            padding: EdgeInsets.only(top: 8.0),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cadastrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print("Login: $login , Senha: $senha ");
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (login.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Nome e/ou Senha inválido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }
  }
}
