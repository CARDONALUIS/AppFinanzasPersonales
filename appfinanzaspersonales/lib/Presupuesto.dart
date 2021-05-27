import 'package:flutter/material.dart';

class PresupuestosPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presupuestos"),
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: 290.0,
          color: Colors.red[200],
          margin: EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.topRight,
          ),
        ),
      ),

    );

  }
}


