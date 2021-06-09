import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegIngYEgrePantalla extends StatelessWidget {
  final String uid;

  RegIngYEgrePantalla({Key key, this.uid}) : super(key: key);

  final controladorTipo = TextEditingController();
  final controladorFecha = TextEditingController();
  final controladorCantidad = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('HOLAAAAAAAAAAA');
    print(uid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Ingresos y Egresos"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
                width: 300,
                height: 190.0,
                child: Card(
                    color: Color.fromRGBO(234, 190, 195, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: MyStatefulWidget(),
                    ))
                // height: 135,
                ),
            Text(
              'Categoria / Tipo',
              style: TextStyle(fontSize: 20.0),
            ),
            textCardTipo(controladorTipo),
            Text(
              'Fecha',
              style: TextStyle(fontSize: 20.0),
            ),
            textCardFecha(controladorFecha, context),
            Text(
              'Cantidad',
              style: TextStyle(fontSize: 20.0),
            ),
            textCard3(controladorCantidad),
            FlatButton(
              child: Text(
                'Guardar',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Color.fromRGBO(204, 83, 92, 1),
              textColor: Colors.white,
              onPressed: () async {
                CollectionReference coleccion =
                    FirebaseFirestore.instance.collection("movimientos");

                //if (await coleccion.doc(uid).get() == null) {
                await coleccion.doc(uid).set({
                  'tipo': controladorTipo.text,
                  'fecha': controladorFecha.text,
                  'cantidad': controladorCantidad.text
                });
                //});
                //}
                // var date = await showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(1900),
                //     lastDate: DateTime(2100));
                // controladorFecha.text = date.toString().substring(0, 10);
                // obtenemos los datos ingresados por el usuario
                print(controladorCantidad.text +
                    ' ' +
                    controladorFecha.text +
                    ' ' +
                    controladorTipo.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum SingingCharacter { ingreso, egreso }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.ingreso;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Ingresos'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.ingreso,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Egreso'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.egreso,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

Card textCardTipo(TextEditingController controller) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(20),
    elevation: 10,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
          child: Center(
            child: TextField(
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ),
      ],
    ),
  );
}

Card textCardFecha(TextEditingController controller, context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(20),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
          child: Center(
            child: TextField(
                readOnly: true,
                controller: controller,
                obscureText: false,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                //decoration: InputDecoration(hintText: 'Fecha'),
                //controller: usuarioController,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  controller.text = date.toString().substring(0, 10);
                }),
          ),
        ),
      ],
    ),
  );
}

Card textCard3(TextEditingController controller) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(20),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
          child: Center(
            child: TextField(
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //decoration: InputDecoration(hintText: 'Detalle'),
              //controller: usuarioController,
            ),
          ),
        ),
      ],
    ),
  );
}
