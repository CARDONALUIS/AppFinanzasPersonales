import 'package:flutter/material.dart';

class RegUsuarioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" "),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            registroCard(),
            FlatButton(
                child: Text(
                  '                    Registrar usuario                    ',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.all(17),
    elevation: 12,
    child: Column(
      children: <Widget>[
        Image(
          height: 150,
          // Como queremos traer una imagen desde un url usamos NetworkImage
          image: NetworkImage(
              'https://images.vexels.com/media/users/3/135251/isolated/preview/ab893f9074d536e3e940d61f0fc62b39-los-usuarios-firman-en-rojo-by-vexels.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Nombre(s):',
                hintText: 'Ingresa tu nombre'),
          ),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Contraseña:',
                hintText: 'Al menos 6 caracteres'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 15),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(204, 83, 92, 1),
                border: OutlineInputBorder(),
                labelText: 'Confirmar contraseña:',
                hintText: 'Al menos 6 caracteres'),
          ),
        ),
      ],
    ),
  );
}
