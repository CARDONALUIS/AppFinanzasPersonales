import 'package:flutter/material.dart';

class PresupuestosPantalla extends StatelessWidget {
  final String uid;
  final String ingresos, egresos, presupuesto;
  PresupuestosPantalla(
      {Key key, this.uid, this.egresos, this.ingresos, this.presupuesto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presupuestos"),
      ),
      body: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: CreaCard("ingresos: ", ingresos),
              ),
              SizedBox(
                width: double.infinity,
                child: CreaCard("Egresos: ", egresos),
              ),
              SizedBox(
                width: double.infinity,
                child: CreaCard("Presupuesto: ", presupuesto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Card CreaCard(String texto, String valor) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(texto,
                textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(valor,
                textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
          ),
        )
      ],
    ),
  );
}
