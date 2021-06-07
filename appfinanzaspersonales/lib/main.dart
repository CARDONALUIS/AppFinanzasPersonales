import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'principal.dart';
import 'RegistroUsuario.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future firebaseiniciacion() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}

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
      /*home: Scaffold(
        body: MyHomePage(),
      ),*/
      home: FutureBuilder(
        future: firebaseiniciacion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage();
            //return Login();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

final usuarioController = TextEditingController();
final contrasenaController = TextEditingController();

class MyHomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference coleccion =
      FirebaseFirestore.instance.collection("coleccion");

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
      ),      
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("El siguiente es un texto que viene de firesbase"),
            FutureBuilder(
                future: coleccion.doc('iddocumento').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data.data();
                    print(data);
                    return Text('Campo: ${data['campo']}');
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );*/
        Scaffold(
            body: Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                loginCard(),
                FlatButton(
                  child: Text(
                    '                             Ingresa                             ',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  color: Color.fromRGBO(204, 83, 92, 1),
                  textColor: Colors.white,
                  onPressed: () async {
                    /*
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Contraseña correcta'),
                    );
                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homePrincipal()),
                    );
                    if (usuarioController.text == "admin" &&
                        contrasenaController.text == "admin") {
                      final snackBar = SnackBar(
                        content: Text('Contraseña correcta'),
                      );
                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }*/
                    try {
                      final user = await auth.signInWithEmailAndPassword(
                          email: usuarioController.text,
                          password: contrasenaController.text);

                      if (user != null) {
                        //final snackBar = SnackBar(
                        //  content: Text('Contraseña correcta'),
                        //);
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homePrincipal()),
                        );
                      }
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: Text('Contraseña incorrecta'),
                        action: SnackBarAction(
                          label: 'Deshacer',
                          onPressed: () {},
                        ),
                      );
                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
                SizedBox(height: 10),
                Text(
                  '¿Aún no tienes cuenta?, registrate aquí',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(204, 83, 92, 1),
                  ),
                ),
                FlatButton(
                    child: Text(
                      '                    Registrar usuario                    ',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    color: Color.fromRGBO(204, 83, 92, 1),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegUsuarioPantalla()),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    CarouselSlider(items: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 250,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/car1.jpg",
                                      height: 200,
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 250,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/car2.jpg",
                                      height: 200,
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 250,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/car3.jpg",
                                      height: 200,
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ], options: CarouselOptions(autoPlay: true))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

Card loginCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.all(17),
    elevation: 12,
    child: Column(
      children: <Widget>[
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
                labelText: 'Usuario:',
                hintText: 'Nombre de usuario'),
            controller: usuarioController,
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
                labelText: 'Contraseña:',
                hintText: 'Al menos 6 caracteres'),
            controller: contrasenaController,
          ),
        ),
      ],
    ),
  );
}
