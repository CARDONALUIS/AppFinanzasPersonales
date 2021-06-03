import 'package:flutter/material.dart';
import 'Configuracion.dart';
import 'Gastos.dart';
import 'Presupuesto.dart';
import 'RegistroIngrYEgre.dart';

class homePrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presupuestos"),
      ),
      body: Container(
        child: Column(
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
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Listado'),
              decoration: BoxDecoration(
                color: Color.fromRGBO(204, 83, 92, 1),
              ),
            ),
            Ink(
                color: Color.fromRGBO(221, 59, 71, 1),
                child: ListTile(
                  title: Text('       °Ingresos y egresos'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegIngYEgrePantalla()),
                    );
                  },
                )),
            Ink(
                color: Color.fromRGBO(221, 59, 71, 1),
                child: ListTile(
                  title: Text('       °Presupuesto'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PresupuestosPantalla()),
                    );
                  },
                )),
            Ink(
                color: Color.fromRGBO(221, 59, 71, 1),
                child: ListTile(
                  title: Text('       °Gastos'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GastosPantalla()),
                    );
                  },
                )),
            Ink(
                color: Color.fromRGBO(221, 59, 71, 1),
                child: ListTile(
                  title: Text('       °Configuracion de aplicacion'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfiPerfilPantalla()),
                    );
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
    color = Colors.red;
  else
    color = Colors.green;

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
