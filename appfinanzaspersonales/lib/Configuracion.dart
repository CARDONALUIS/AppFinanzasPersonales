import 'package:flutter/material.dart';

class ConfiPerfilPantalla extends StatelessWidget {
  var _listaMoneda = ['Peso', 'Dolar'];
  String _vistaMoneda = 'seleccione un tipo de moneda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuraciones"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Cambiar moneda',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 5),
                DropdownButton(
                  items: _listaMoneda.map((String a) {
                    return DropdownMenuItem(value: a, child: Text(a));
                  }).toList(),
                  onChanged: (_) {},
                  hint: Text(_vistaMoneda),
                ),
                SizedBox(height: 80),
                Text(
                  'Configura tu contraseña',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 40),
                Container(
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Contraseña nueva',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Confirma contraseña',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                SizedBox(height: 60),
                FlatButton(
                    child: Text(
                      'Guardar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Color.fromRGBO(204, 83, 92, 1),
                    textColor: Colors.white,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
