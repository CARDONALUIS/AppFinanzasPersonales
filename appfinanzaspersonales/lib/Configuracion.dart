import 'package:flutter/material.dart';

class ConfiPerfilPantalla extends StatelessWidget {
  var _listaMoneda = ['Peso', 'Dolar'];
  String _vistaMoneda = 'seleccione un tipo de moneda';

  var _listaPeriodos = [
    'Por dia',
    'Tercer dia',
    'Fin de semana',
  ];
  String _vistaPeriodos = 'seleccione el periodo';

  var _listaHoras = ['7 am', '10 am', '2pm', '5pm', '7 pm', '11pm'];
  String _vistaHoras = 'seleccione un hora';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion de aplicacion"),
      ),
      body: Center(
        /*child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Regresar!'),
        ),*/
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              'Cambiar moneada',
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              'Recordatorio de notificaciones',
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              child: Row(
                children: <Widget>[
                  Text(
                    'Periodos',
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
              child: Row(
                children: <Widget>[
                  DropdownButton(
                    items: _listaPeriodos.map((String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text(_vistaPeriodos),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              child: Row(
                children: <Widget>[
                  Text(
                    'Hora',
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
              child: Row(
                children: <Widget>[
                  DropdownButton(
                    items: _listaHoras.map((String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text(_vistaHoras),
                  ),
                ],
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
      ),
    );
  }
}
