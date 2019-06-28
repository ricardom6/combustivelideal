import 'package:flutter/material.dart';
import 'package:combustivelideal/postoFormat.dart';
import 'package:combustivelideal/helper.dart';
import 'package:combustivelideal/historico.dart';
import 'package:date_format/date_format.dart';

class Cadastro extends StatefulWidget {
  @override
  Cadastro();
  _CadastroState createState() => _CadastroState();
}
class _CadastroState extends State<Cadastro> {
  Helper helper = Helper();
  final _pEtController = TextEditingController();
  final _pGasController = TextEditingController();
  final _nameController = TextEditingController();
  final Posto _postoTemp = Posto();

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
  Widget buildCtnButton() {
    return Container(
        padding: EdgeInsets.fromLTRB(8, 24, 8, 24),
        height: 100.0,
        child: RaisedButton(
          onPressed: () {
            //validar, calcular e salvar
            print("primeiro");
            _calcular();

          },
          child: Text("Verificar e salvar"),
          color: Colors.blue,
        ));
  }
  void _salvar(){
    helper.insert(_postoTemp);
    _clearTela();
  }
  void _clearTela(){
    _postoTemp.id = null;
    _nameController.text = ("");
    _pEtController.text = ("");
    _pGasController.text = ("");
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

              //TextAlign textAlign: TextAlign.start,
              controller: _nameController,
              onChanged: (text) {
                setState(() {
                  _postoTemp.nome = text;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do Etanol:",
              ),
              controller: _pEtController,
              onChanged: (text) {
                setState(() {
                  _postoTemp.pEt = text;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço da gasolina:",
              ),
              controller: _pGasController,
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
    _postoTemp.data = formatDate(DateTime.now(), ['Dia ', dd, '/', mm, '/', yyyy, ' as ', HH, ':', nn, 'hs.']);
    //_postoTemp.data = ("Inserir nova data.");
    if (dresult > 0.7){
      _postoTemp.result = ("È melhor utilizar gasolina.");
    } else {
      _postoTemp.result = ("È melhor utilizar etanol.");
    }
    //fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  print("segundo");
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Resultado:"),
            content: Text(_postoTemp.result),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  _salvar();
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}
