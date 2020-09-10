import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'bt-controller.dart';
import 'tela2.dart';

class ArduinoBT extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {

  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool ledState = false;

  @override
  initState() {
    //Quando a tela inicia o bluetooth enumera os dispositivos disponíveis
    super.initState();
    BTController.init();
    encontrarDispositivos();
  }

    //Função que para os movimento
    void desligar() {
      BTController.transmit('0');
    }

    //Função que liga o movimento de sucção
    void ligarSuccao() {
      BTController.transmit('1');
    }

    //Função que liga o movimento de sucção
    void ligarMaxilar() {
      BTController.transmit('2');
    }

    //Função que liga o movimento automático
    void ligarAutomatico() {
      BTController.transmit('3');
    }

    //BLUETOOTH - Função que enumera os dispositivos
    Future<void> encontrarDispositivos() async {
      BTController.enumerateDevices()
          .then((devices) { onGetDevices(devices); });
    }

    //BLUETOOTH - Função que mostra e seleciona um dispositivo
    void onGetDevices(List<dynamic> devices) {
      Iterable<SimpleDialogOption> options = devices.map((device) {
        return SimpleDialogOption(
          child: Text(device.keys.first),
          onPressed: () { selecionarDispositivo(device.values.first); },
        );
      });
      //Mostra a lista com os dispositivos
      SimpleDialog dialog = SimpleDialog(
        title: const Text('Conecte-se com a sua boneca!'), //titulo da lista
        children: options.toList(),
      );
      // show the dialog
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) { return dialog; }
      );
    }

    //BLUETOOTH - Função para selecionar o dispositvo
    selecionarDispositivo(String deviceAddress) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      BTController.connect(deviceAddress);
  }


  //CRIAÇÃO DE TELA
  @override
  Widget build(BuildContext context) {
    const cor = Color(0xFFf7fff7); //cor para os botões
    double opacidade = 0.4; //opacidade para os botões
    return Stack(

      //BACKGROUND
      children: <Widget>[new Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('Assets/frame3.png'),
            fit: BoxFit.cover,),
        ),
      ),

        //LINHA 1 - BOTÕES
        Positioned(
          top: 100,

          //BOTÃO PARA INICIAR O MOVIMENTO AUTOMÁTICO
          child: Container(
            width: 170,
            padding: const EdgeInsets.only(bottom: 8.0, left:10.0),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)
              ),
              color: cor.withOpacity(0),
              child: Container(
                child: Text(
                  'Iniciar',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              onPressed: ligarAutomatico,
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ),

        //LINHA 2 - BOTÕES
        Positioned(
          top: (MediaQuery.of(context).size.height/2)+40,

          //BOTÃO PARA INTERROMPER OS MOVIMENTO
          child: Container(
            width: 170,
            padding: const EdgeInsets.only(bottom: 8.0, left:10.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)
              ),
              color: cor.withOpacity(0),
              child: Container(
                child: Text(
                  'Parar',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                padding: EdgeInsets.all(8.0),
              ),
              onPressed: desligar,
            ),
          ),
        ),

        //BOTÃO PARA VOLTAR A PÁGINA
        Positioned(
          bottom: 5.0,
          left: 5.0,
          child: FloatingActionButton(
            child: Container(
              child: Icon(Icons.arrow_back, color: Colors.white,),
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Tela2()
                )
            ),
          ),
        ),

      ],
    );
  }

}