import 'package:flutter/material.dart';
import 'Configuracion.dart';
import 'Gastos.dart';
import 'Presupuesto.dart';
import 'RegistroIngrYEgre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'IngresosEgresosController.dart';

class homePrincipal extends StatelessWidget {
  //final String uid;
  final FirebaseAuth userActual;
  homePrincipal(this.userActual);

  //const homePrincipal({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('HOLAAAAAAAAAAA');
    //print(uid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              // por cada ingreso e ingreso de la base de datos, crear un card
              children: [
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Egreso"),
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Ingreso"),
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Ingreso"),
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Egreso"),
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Ingreso"),
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 135,
                  child: HistorialCard("Egreso"),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/login.png", height: 100, width: 100),
                    Text(userActual.currentUser.email),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
            ),
            Ink(
                child: ListTile(
              leading: Icon(
                Icons.repeat,
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
              title: Text('Ingresos y egresos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegIngYEgrePantalla(
                            uid: userActual.currentUser.uid,
                          )),
                );
              },
            )),
            Ink(
                child: ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
              title: Text('Presupuesto'),
              onTap: () async {
                String ing, eg, pre;
                await obtenTotalMovimientos(
                        userActual.currentUser.uid, 'ingresos')
                    .then((value) {
                  if (value != null)
                    ing = value.toString();
                  else
                    ing = '0';
                });
                await obtenTotalMovimientos(
                        userActual.currentUser.uid, 'egresos')
                    .then((value) {
                  if (value != null)
                    eg = value.toString();
                  else
                    eg = '0';
                });

                double p = double.parse(ing) - double.parse(eg);
                if (p > 0) {
                  pre = p.toString();
                } else
                  pre = '0';
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PresupuestosPantalla(
                            uid: userActual.currentUser.uid,
                            ingresos: ing,
                            egresos: eg,
                            presupuesto: pre,
                          )),
                );
              },
            )),
            Ink(
                child: ListTile(
              leading: Icon(
                Icons.perm_device_info,
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
              title: Text('Gastos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GastosPantalla()),
                );
              },
            )),
            Ink(
                child: ListTile(
              leading: Icon(
                Icons.settings_rounded,
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
              title: Text('Configuracion de usuario'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConfiPerfilPantalla(userActual)),
                );
              },
            )),
            Ink(
                child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
              contentPadding: EdgeInsets.only(top: 300.0),
              title: Text('Salir'),
              onTap: () {
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
}

// cosas del historial (pantalla principal)
Card HistorialCard(String tipo) {
  Color color;
  if (tipo == "Egreso")
    color = Color.fromRGBO(221, 134, 140, 1);
  else
    color = Color.fromRGBO(168, 243, 135, 1);

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    color: color,
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$tipo:",
                textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
            Text("Fecha",
                textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
            Text("Cantidad",
                textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
            Text("Tipo",
                textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
          ]),
    ),
  );
}
