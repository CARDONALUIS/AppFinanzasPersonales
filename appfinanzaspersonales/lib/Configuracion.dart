import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfiPerfilPantalla extends StatelessWidget {
  final FirebaseAuth userActual;
  ConfiPerfilPantalla(this.userActual);

  //var _listaMoneda = ['Peso', 'Dolar'];
  //String _vistaMoneda = 'seleccione un tipo de moneda';
  final contrasenaController = TextEditingController();
  final contrasena2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion de usuario"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Configura tu usuario',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Minimo 6 caracteres',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    controller: contrasenaController,
                  ),
                ),
                SizedBox(height: 80),
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
                      hintText: 'Minimo 6 caracteres',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    controller: contrasenaController,
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
                        hintText: 'Minimo 6 caracteres',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    controller: contrasena2Controller,
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
                    onPressed: () async {
                      try {
                        if (contrasena2Controller.text ==
                            contrasena2Controller.text) {
                          userActual.currentUser
                              .updatePassword(contrasena2Controller.text);

                          final snackBar = SnackBar(
                            content: Text('Contraseña actualizada'),
                            action: SnackBarAction(
                              label: 'Deshacer',
                              onPressed: () {},
                            ),
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                            content: Text('Las contraseñas no coinciden'),
                            action: SnackBarAction(
                              label: 'Deshacer',
                              onPressed: () {},
                            ),
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text('No se pudieron actualizar los datos'),
                          action: SnackBarAction(
                            label: 'Deshacer',
                            onPressed: () {},
                          ),
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
