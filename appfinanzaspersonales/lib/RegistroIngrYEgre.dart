import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int movimiento = 0;

class RegIngYEgrePantalla extends StatelessWidget {
  final String uid;
  CollectionReference coleccion =
      FirebaseFirestore.instance.collection("movimientos");
  RegIngYEgrePantalla({Key key, this.uid}) : super(key: key);
  final controladorTipo = TextEditingController();
  final controladorFecha = TextEditingController();
  final controladorCantidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    movimiento = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Ingresos y Egresos"),
      ),
      body: Container(
        child: ListView(
            children: <Widget>[
              Column(
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
                  textCardCantidad(controladorCantidad),
                  FlatButton(
                    child: Text(
                      'Guardar',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Color.fromRGBO(204, 83, 92, 1),
                    textColor: Colors.white,
                    onPressed: ()
                    async {
                      guardaMovimiento(
                          coleccion,
                          uid,
                          controladorTipo.text,
                          controladorFecha.text,
                          controladorCantidad.text,
                          movimiento);
                      return showDialog(
                        context: context,
                        //builder: (_) => _buildAlertDialog(),
                          builder: (BuildContext context) => AlertDialog(
                        title: const Text('¡Registro Exitoso!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Arial', fontSize: 20), ),
                        content: const Text('El Registro se ha agregado correctamente',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Arial', fontSize: 14),
                          ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK',
                            textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                      );
                      },
                    ),
                ],
              ),
            ]
        )
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
                print('SETSTATEIGNRESO');
                movimiento = 0;
                _character = value;
              });
            },
          ),
          // onTap: () {
          //   movimiento = 0;
          //   print('ONTAPINGRESSO');
          // }
        ),
        ListTile(
          title: const Text('Egreso'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.egreso,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                print('SETSTATE EGRESO');
                movimiento = 1;
                _character = value;
              });
            },
          ),
          // onTap: () {
          //   movimiento = 1;
          //   print('ONTAP EGRESO');
          // },
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

Card textCardCantidad(TextEditingController controller) {
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
              keyboardType: TextInputType.number,
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

void guardaMovimiento(CollectionReference coleccion, String uid, String tipo,
    String fecha, String cantidad, int tipoMovimiento) async {
  if (uid == '' || tipo == '' || fecha == '' || cantidad == '') return;

  int id = -1;
  String movimiento = "ingresos";

  if (tipoMovimiento != 0) movimiento = "egresos";

  await ultimoId(coleccion).then((value) {
    id = value;
  });

  await coleccion
      .doc(uid)
      .collection(movimiento)
      .doc(id.toString())
      .set(({'tipo': tipo, 'fecha': fecha, 'cantidad': cantidad}));

  actuailzaID(coleccion);
}

Future<int> ultimoId(CollectionReference coleccion) async {
  int id = -1;

  await coleccion.doc("ids").get().then((snapshot) {
    id = snapshot.data()['ultimoID'];
  });

  print(id);

  return id;
}

void actuailzaID(CollectionReference coleccion) async {
  int id = -1;

  await ultimoId(coleccion).then((value) {
    id = value;
  });

  print(id);

  await coleccion.doc("ids").set({
    'ultimoID': (id + 1),
  });
}


Widget _buildAlertDialog() {
  return AlertDialog(
    title: Text('Registro Exitoso'),
  );
}




