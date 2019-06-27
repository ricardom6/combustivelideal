import 'package:flutter/material.dart';
import 'package:combustivelideal/helper.dart';
import 'package:combustivelideal/postoFormat.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  Helper helper = Helper();
  List<Posto> lsPosto = List();

  void _loadAll() {
    helper.selectAll().then((list){
      setState(() { //duvidas
        lsPosto = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    /*Posto postoA = Posto();
    postoA.nome   = "teste3";
    postoA.pEt    = "251";
    postoA.pGas   = "446";
    postoA.data   = "data";
    postoA.result = "É melhor abastecer com Etanol";
    helper.insert(postoA);
    helper.selectAll().then((list){
      for (Posto a in list){
        print(a);
      }
    });
    print("testessss");*/
    _loadAll();
  }
  Widget buildAppBar() {
    return AppBar (
      title:  Text("Histórico"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }
  Widget buildCards (BuildContext context, int index) {
    return GestureDetector (
      child: Card(
       child: Padding(padding: EdgeInsets.all(10),
       child: Row(
         children: <Widget>[
           Padding(
             padding: EdgeInsets.only(left: 10),
             child: Column (
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(
                   lsPosto[index].nome ?? "-",
                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,

                   ),
                 ),
                 Text(
                   lsPosto[index].pEt ?? "-",
                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                 ),
                 Text(
                   lsPosto[index].pGas ?? "-",
                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                 ),
                 Text(
                   lsPosto[index].data ?? "-",
                   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                 ),
                 Text(
                   lsPosto[index].result ?? "-",
                   style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                 )
               ],
             ),
           )
         ],
       ),
       ),
      ),
      onTap: (){
        _showOptions(context, index);
      },
    );
  }
  void _showOptions(BuildContext context, int index)
  {
    showModalBottomSheet(
        context: context,
        builder: (context) {
      return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
                color: Colors.black,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Excluir",
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      onPressed: () {
                        helper.delete(lsPosto[index].id);
                        setState(() {
                          lsPosto.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ));
          });
    });
    }
    Widget buildListView(){
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: lsPosto.length,
        itemBuilder: (context, index){
          return buildCards(context, index);
    });
    }
    Widget buildScaffold(){
      return Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: buildListView(),
      );
    }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}
