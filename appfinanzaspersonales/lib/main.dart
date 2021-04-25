import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'FinApp'),
    );
  }
}

//class MyHomePage extends StatefulWidget  {
class MyHomePage extends StatefulWidget {
  //final String title;

  //MyHomePage({Key? key, required this.title}) : super(key: key);
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Has presionado el botón tantas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu FinApp'),
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
              ),
            ),
            ListTile(
              title: Text('Registrar ingresos y egresos'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Yay! Opcion 1!'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: Text('Presupuesto'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Yay! Opcion 2!'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: Text('Gastos'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Yay! Opcion 3!'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: Text('Configuracion del perfil'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text('Yay! Opcion 4!'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
