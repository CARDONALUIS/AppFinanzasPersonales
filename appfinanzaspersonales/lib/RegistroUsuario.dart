import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class RegUsuarioPantalla extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" "),
        ),
        body: ListView(
          children: [
            Center(
                child: Column(
              children: <Widget>[
                registroCard(),
                FlatButton(
                    child: Text(
                      '                    Registrar usuario                    ',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    color: Color.fromRGBO(204, 83, 92, 1),
                    textColor: Colors.white,
                    onPressed: () async {
                      //registerUser();
                      if (contrasenaController.text != "" &&
                          contrasenaConfirmacionController.text != "" &&
                          usuarioController.text != "") {
                        if (contrasenaController.text ==
                            contrasenaConfirmacionController.text) {
                          UserCredential credential = await register(
                              usuarioController.text,
                              contrasenaController.text);
                          if (credential.user != null) {
                            final snackBar = SnackBar(
                              content: Text('Usuario Registrado'),
                              action: SnackBarAction(
                                label: 'Deshacer',
                                onPressed: () {},
                              ),
                            );
                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
                          } else {
                            final snackBar = SnackBar(
                              content: Text('Usuario no registrado'),
                              action: SnackBarAction(
                                label: 'Deshacer',
                                onPressed: () {},
                              ),
                            );
                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          final snackBar = SnackBar(
                            content: Text('Constraseñas no coinciden'),
                            action: SnackBarAction(
                              label: 'Deshacer',
                              onPressed: () {},
                            ),
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        final snackBar = SnackBar(
                          content: Text('Hay campos vacios'),
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
            ))
          ],
        ));
  }

  Future<UserCredential> register(String _email, String _pass) async {
    return auth.createUserWithEmailAndPassword(email: _email, password: _pass);
  }
}

final usuarioController = TextEditingController();
final contrasenaController = TextEditingController();
final contrasenaConfirmacionController = TextEditingController();

Card registroCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.all(17),
    elevation: 12,
    child: Column(
      children: <Widget>[
        // Image(
        //   height: 150,
        //   // Como queremos traer una imagen desde un url usamos NetworkImage
        //   image: NetworkImage(
        //       'https://images.vexels.com/media/users/3/135251/isolated/preview/ab893f9074d536e3e940d61f0fc62b39-los-usuarios-firman-en-rojo-by-vexels.png'),
        // ),
        Image.asset(
          "assets/login.png",
          height: 150,
          width: 150,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Correo:',
                hintText: 'Ingresa tu correo'),
            controller: usuarioController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Contraseña:',
                hintText: 'Al menos 6 caracteres'),
            controller: contrasenaController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 15),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Confirmar contraseña:',
                hintText: 'Al menos 6 caracteres'),
            controller: contrasenaConfirmacionController,
          ),
        ),
      ],
    ),
  );
}
