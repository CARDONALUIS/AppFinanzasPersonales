import 'package:flutter/material.dart';
import 'Configuracion.dart';
import 'Gastos.dart';
import 'RegistroUsuario.dart';
import 'Presupuesto.dart';
import 'RegistroIngrYEgre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(236, 240, 241, 1),
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(204, 83, 92, 1),
        accentColor: Color.fromRGBO(221, 59, 71, 1),
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'Historial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  //_MyCustomFormState createState() => _MyCustomFormState();
  _MyHomePageState createState() => _MyHomePageState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
// class _MyCustomFormState extends State<MyHomePage> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Retrieve Text Input'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           controller: myController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 // Retrieve the text the that user has entered by using the
//                 // TextEditingController.
//                 content: Text(myController.text),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         child: Icon(Icons.text_fields),
//       ),
//     );
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            // SizedBox(
            //   width: double.infinity,
            //   // height: 135,
            //   child: HistorialCard("Ingreso"),
            // ),
            // SizedBox(
            //   width: double.infinity,
            //   // height: 135,
            //   child: HistorialCard("Egreso"),
            // ),
            // el scroll no funciona
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
            ListTile(
              title: Text('°Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

final usuarioController = TextEditingController();
final contrasenaController = TextEditingController();

class PantallaLogin extends StatelessWidget {
  // controlador de editor de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            loginCard(),
            FlatButton(
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Color.fromRGBO(204, 83, 92, 1),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegUsuarioPantalla()),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              if (usuarioController.text == "admin" &&
                  contrasenaController.text == "admin") {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("login existoso!"),
                );
              } else {
                return AlertDialog(
                  content: Text("credenciales incorrectas!"),
                );
              }
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.supervised_user_circle),
      ),
    );
  }
}

Card loginCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Image(
          // Como queremos traer una imagen desde un url usamos NetworkImage
          image: NetworkImage(
              'https://i2.wp.com/www.silocreativo.com/wp-content/uploads/2017/09/login-wordpress.png?fit=666%2C370&quality=100&strip=all&ssl=1'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Ingresa tu Usuario'),
              controller: usuarioController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Ingresa tu Contraseña'),
              controller: contrasenaController,
            ),
          ),
        ),
      ],
    ),
  );
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
