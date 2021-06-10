import 'package:appfinanzaspersonales/IngresosEgresosController.dart';
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
                child: creaCard("ingresos: ", ingresos),
              ),
              SizedBox(
                width: double.infinity,
                child: creaCard("Egresos: ", egresos),
              ),
              SizedBox(
                width: double.infinity,
                child: creaCard("Presupuesto: ", presupuesto),
              ),
              // calculamos el presupuesto para determinar el mensaje a mostrar
              (() {
                sinPresupuesto(context);
              }())
              // Creamos un widget de forma asyncrona
              // FutureBuilder(
              //   future: obtenTotalMovimientos(uid, 'ingresos'),
              //   builder:
              //       (BuildContext context, AsyncSnapshot<double> ingresos) {
              //     Widget widget;
              //     if (ingresos.hasData) {
              //       widget = SizedBox(
              //         width: double.infinity,
              //         child: CreaCard("Presupuesto: ", presupuesto),
              //       );
              //     } else {
              //       widget = SizedBox(
              //           width: double.infinity,
              //           child: CreaCard("Presupuesto: ", "0.0"));
              //     }
              //     return widget;
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Card creaCard(String texto, String valor) {
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
        ),
      ],
    ),
  );
}

void sinPresupuesto(BuildContext c) {
  showDialog(
    context: c,
    //builder: (_) => _buildAlertDialog(),
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        '¡Gastas más de lo que generas!',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Arial', fontSize: 20),
      ),
      content: const Text(
        'Trata de reducir tus gastos.',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Arial', fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Future conPresupuesto(BuildContext c) {
  return showDialog(
    context: c,
    //builder: (_) => _buildAlertDialog(),
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Generas más de lo que gastas',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Arial', fontSize: 20),
      ),
      content: const Text(
        'Sigue así!',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Arial', fontSize: 14),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
