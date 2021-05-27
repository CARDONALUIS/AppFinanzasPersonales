import 'package:flutter/material.dart';



class RegIngYEgrePantalla extends StatelessWidget {
  const RegIngYEgrePantalla({Key key}) : super(key: key);

  static const String _title = 'Registro de Ingresos y Egresos';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Ingresos y Egresos"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 180.0,
              child: Card(
                color: Color.fromRGBO(152, 193, 217,1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                child: MyStatefulWidget(),
                )
              )
              // height: 135,
            ),
            textCard(),
            textCard2(),
            textCard3(),
        FlatButton(
          child: Text('Guardar', style: TextStyle(fontSize: 20.0),),
          color: Color.fromRGBO(204, 83, 92, 1),
          textColor: Colors.white,
          onPressed: () {}
        ),
          FlatButton(
            child: Text('Regresar', style: TextStyle(fontSize: 20.0),),
            color: Color.fromRGBO(204, 83, 92, 1),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
enum SingingCharacter {ingreso, egreso }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.ingreso;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Ingresos'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.ingreso,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Egreso'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.egreso,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}


Card textCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Categoria / Tipo'),
              //controller: usuarioController,
            ),
          ),
        ),
      ],
    ),
  );
}

Card textCard2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Fecha'),
              //controller: usuarioController,
            ),
          ),
        ),
      ],
    ),
  );
}

Card textCard3() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: 'Detalle'),
              //controller: usuarioController,
            ),
          ),
        ),
      ],
    ),
  );
}