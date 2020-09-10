import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tela1.dart';
import 'tela3.dart';

class Tela2 extends StatefulWidget {
  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      //children: todos os elementos que terão na tela
        children: <Widget>[

          //BACKGROUND
          new Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('Assets/frame2.png'),
                fit: BoxFit.cover,),
            ),
          ),

          //BOTÃO PARA PASSAR DE TELA
          Container(
              padding:const EdgeInsets.only(bottom: 10.0, right:10.0),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  heroTag: "btn1", //herotag utlizada pois há dois floatingactionbutton
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ArduinoBT()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(Icons.arrow_forward, color: Colors.white,),
                  ),
              ),
          ),

          //BOTÃO PARA VOLTAR A TELA
          Container(
              padding:const EdgeInsets.only(bottom: 10.0, left:10.0),
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                  heroTag: "btn2",//herotag utlizada pois há dois floatingactionbutton
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela1()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
              ),
          ),

        ], //FIM DOS COMPONENTES DA TELA
    );
  }
}