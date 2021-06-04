import 'package:flutter/cupertino.dart';
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
                    width: 300,
                    height: 190.0,
                    child: Card(
                        color: Color.fromRGBO(234, 190, 195,1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: MyStatefulWidget(),
                        )
                    )
                  // height: 135,
                ),
                Text('Categoria / Tipo', style: TextStyle(fontSize: 20.0),),
                textCard(),
                Text('Fecha', style: TextStyle(fontSize: 20.0),),
                textCard2(),
                Text('Descripcion', style: TextStyle(fontSize: 20.0),),
                textCard3(),
                FlatButton(
                    child: Text('Guardar', style: TextStyle(fontSize: 20.0),),
                    color: Color.fromRGBO(204, 83, 92, 1),
                    textColor: Colors.white,
                    onPressed: () {}
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
      margin: EdgeInsets.all(20),
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
            child: Center(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                   contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                 border:
                 OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
               ),
                //controller: usuarioController,
              ),
            ),
        ],
      ),
  );
}

Card textCard2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(20),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
          child: Center(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              //decoration: InputDecoration(hintText: 'Fecha'),
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
    margin: EdgeInsets.all(20),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
          child: Center(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 1.0),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              //decoration: InputDecoration(hintText: 'Detalle'),
              //controller: usuarioController,
            ),
          ),
        ),
      ],
    ),
  );
}