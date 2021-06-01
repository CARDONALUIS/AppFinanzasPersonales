import 'package:flutter/material.dart';

class RegUsuarioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro de usuario"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            registroCard(),
            FlatButton(
                child: Text(
                  'Registrar usuario',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Color.fromRGBO(204, 83, 92, 1),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        )));
  }
}

Card registroCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Nombre'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Usuario'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Contraseña'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Confirmar contraseña'),
            ),
          ),
        ),
      ],
    ),
  );
}
