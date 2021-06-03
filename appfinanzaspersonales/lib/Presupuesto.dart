import 'package:flutter/material.dart';

class PresupuestosPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presupuestos"),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: CreaCard("Ingresos netos: \$", "10,000"),
              ),
              SizedBox(
                width: double.infinity,
                child: CreaCard("Egresos: \$", "8,000"),
              ),
              SizedBox(
                width: double.infinity,
                child: CreaCard("Presupuesto: \$", "2,000"),
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
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(children: <Widget>[
        Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          // alignment: Alignment.center,
          child: Text(texto,
              textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
        ),
        Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          // alignment: Alignment.center,
          child: Text(valor,
              textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
        ),
      ]),
    ),
  );
}
