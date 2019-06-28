import 'package:flutter/material.dart';
import 'package:combustivelideal/cadastro.dart';

class SplashHome extends StatefulWidget {
  @override
  _SplashHomeState createState() => _SplashHomeState();
}
class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Cadastro()));
    });}
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
    Image.asset(
    "images/fundo_m6.jpeg",
      fit: BoxFit.cover,
      height: 1000.0,
    ),
        Padding(
            padding: EdgeInsets.only(top: 40)
            ,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Text("M6 Automação",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
              ),
    ]
    )
        ),
        Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column (
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Versão-1",
                    style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ]
            )
        ),
    ]);
  }
}