import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

Future<double> calculaPresupuesto(String uid) async {
  double presupuesto = 0.0;
  await obtenTotalMovimientos(uid, 'ingresos');
  return presupuesto;
}

Future<double> obtenTotalMovimientos(String uid, String movimiento) async {
  double presupuesto = 0.0;

  final CollectionReference coleccion =
      FirebaseFirestore.instance.collection("movimientos");

  try {
    await coleccion.doc(uid).collection(movimiento).get().then((ss) {
      ss.docs.forEach((element) {
        presupuesto += double.parse(element.data()['cantidad']);
        print(element.data()['cantidad']);
        print(element.data()['tipo']);
        print(element.data()['fecha']);
      });
    });

    return presupuesto;
  } catch (Exception) {
    return null;
  }
}

Future<List<movimiento>> historiales(String uid) async {
  List<movimiento> movimientos = [];
  movimiento m = movimiento();
  final CollectionReference coleccion =
      FirebaseFirestore.instance.collection("movimientos");

  try {
    await coleccion.doc(uid).collection('ingresos').get().then((ss) {
      ss.docs.forEach((element) {
        m = movimiento();
        m.cantidad = element.data()['cantidad'];
        m.tipo = element.data()['tipo'];
        m.fecha = element.data()['fecha'];
        m.tipoMovimiento = "Ingreso";
        movimientos.add(m);
      });
    });

    await coleccion.doc(uid).collection('egresos').get().then((ss) {
      ss.docs.forEach((element) {
        m = movimiento();
        m.cantidad = element.data()['cantidad'];
        m.tipo = element.data()['tipo'];
        m.fecha = element.data()['fecha'];
        m.tipoMovimiento = "Egreso";
        movimientos.add(m);
      });
    });

    return movimientos;
  } catch (Exception) {
    return null;
  }
}

// ignore: camel_case_types
class movimiento {
  String tipoMovimiento = "";
  String tipo = "";
  String cantidad = "";
  String fecha = "";
}
