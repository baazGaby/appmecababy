import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tela2.dart';


class Tela1S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Tela1(),
      debugShowCheckedModeBanner: false, //tira a faixa de debug
    );
  }
}

class Tela1 extends StatefulWidget {
  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      //BACKGROUND
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('Assets/frame1.png'),
              fit: BoxFit.cover,),
          ),
        ),
        //FIM DO BACKGROUND

        //BOTÃO PARA PASSAR PARA A PRÓXIMA TELA
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela2()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0), //margem e padding interno
              child: Icon(Icons.arrow_forward, color: Colors.white,), //icone da flecha
            ))
    );
  }
}
