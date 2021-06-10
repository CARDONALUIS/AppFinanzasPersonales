import 'package:cloud_firestore/cloud_firestore.dart';

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
