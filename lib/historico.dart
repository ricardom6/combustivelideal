import 'package:flutter/material.dart';
import 'package:combustivelideal/helper.dart';
import 'package:combustivelideal/postoFormat.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  Helper helper = Helper();

  @override
  void initState() {
    super.initState();

    Posto postoA = Posto();
    postoA.nome   = "teste2";
    postoA.pEt    = "250";
    postoA.pGas   = "445";
    postoA.data   = "data";
    postoA.result = "É melhor abastecer com Etanol";

    helper.insert(postoA);/**/
    helper.selectAll().then((list){
      for (Posto a in list){
        print(a);
      }
    });
    print("testessss");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
