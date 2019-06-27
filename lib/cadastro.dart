import 'package:flutter/material.dart';
import 'package:combustivelideal/postoFormat.dart';
import 'package:combustivelideal/helper.dart';
import 'package:combustivelideal/historico.dart';
import 'dart:io';

class Cadastro extends StatefulWidget {
  @override
  //final Posto posto;

  //Cadastro();

  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  Helper helper = Helper();
  final _pEtController = TextEditingController();
  final _pGasController = TextEditingController();
  Posto _postoTemp;

  Widget buildAppBar() {
    return AppBar(
      title: Text("Cadastro Posto"),
      backgroundColor: Colors.black,
      centerTitle: true,
        actions: <Widget>[
    IconButton(
    icon: Icon(Icons.playlist_play),
    tooltip: 'Air it',
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Historico()
              ));
        }
    )
    ]
    );
  }

  //criar raizedButton para salvar
  Widget buildCtnButton() {
    return Container(
        padding: EdgeInsets.fromLTRB(8, 24, 8, 24),
        height: 100.0,
        child: RaisedButton(
          onPressed: () {
            //validar, calcular e salvar
            _calcular();
            _postoTemp.data = ("hoje KKKK");
            helper.insert(_postoTemp);
          },
          child: Text("Verificar e salvar"),
          color: Colors.blue,
        ));
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Nome:",
              ),
              onChanged: (text) {
                setState(() {
                  _postoTemp.nome = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Preço do Etanol:",
              ),
              onChanged: (text) {
                setState(() {
                  _postoTemp.pEt = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Preço da gasolina:",
              ),
              onChanged: (text) {
                setState(() {
                  _postoTemp.pGas = text;
                });
              },
            ),
            buildCtnButton()
          ],
        ),
      ),
    );
  }
  void _calcular (){
    double pEt = double.parse(_postoTemp.pEt);
    double pGas = double.parse(_postoTemp.pGas); //celsius * 1.8 +32.0;
    double dresult = pEt / pGas;
    if (dresult > 0.7){
      _postoTemp.result = ("È mais lucrativo abastecer com gasolina.");
    } else {
      _postoTemp.result = ("È mais lucrativo abastecer com etanol.");
    }
    //fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}
