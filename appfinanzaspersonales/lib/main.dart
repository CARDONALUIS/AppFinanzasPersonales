import 'package:flutter/material.dart';

import 'principal.dart';
import 'RegistroUsuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(236, 240, 241, 1),
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(204, 83, 92, 1),
        accentColor: Color.fromRGBO(221, 59, 71, 1),
        primarySwatch: Colors.red,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

final usuarioController = TextEditingController();
final contrasenaController = TextEditingController();

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 75.0),
                child: Column(
                  children: <Widget>[
                    Image(
                        // Como queremos traer una imagen desde un url usamos NetworkImage
                        image: NetworkImage(
                            'https://i2.wp.com/www.silocreativo.com/wp-content/uploads/2017/09/login-wordpress.png?fit=666%2C370&quality=100&strip=all&ssl=1'),
                        height: 150,
                        fit: BoxFit.fill),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50.0),
                  width: 250,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Usuario",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(204, 83, 92, 1),
                              fontSize: 12),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.cancel,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(204, 83, 92, 1),
                                  width: 2.0),
                            ),
                          ),
                          controller: usuarioController,
                        ),
                      ])),
              Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: 250,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Contraseña",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.red.shade400, fontSize: 12),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.cancel,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(204, 83, 92, 1),
                                  width: 2.0),
                            ),
                          ),
                          controller: contrasenaController,
                        ),
                      ])),
              Container(
                margin: EdgeInsets.only(top: 60.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(flex: 10),
                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            if (usuarioController.text == "admin" &&
                                contrasenaController.text == "admin") {
                              final snackBar = SnackBar(
                                content: Text('Contraseña correcta'),
                              );
                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePrincipal()),
                              );
                            } else {
                              final snackBar = SnackBar(
                                content: Text('Contraseña incorrecta'),
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
                          },
                          child: Text('Login'),
                        ),
                      ),
                      Spacer(flex: 5),
                      SizedBox(
                        width: 85,
                        child: ElevatedButton(
                          onPressed: () {
                            ////
                            ///
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegUsuarioPantalla()),
                            );
                          },
                          child: Text('Sign In'),
                        ),
                      ),
                      Spacer(flex: 10),
                    ]),
              ),
            ],
          ),
        ));
  }
}
