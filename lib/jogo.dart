import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção:";

  void _opcSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var randomNumber = Random().nextInt(3);
    var escolhaApp = opcoes[randomNumber];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          imagemApp = AssetImage("assets/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          imagemApp = AssetImage("assets/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          imagemApp = AssetImage("assets/tesoura.png");
        });
        break;
    }

    //Validando vencedor 
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      _mensagem = "Você venceu!"; 
    } else if((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      _mensagem = "Você perdeu :("; 
    }else{
            _mensagem = "Empate!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: imagemApp),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcSelecionada("pedra"),
                child: Image.asset('assets/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcSelecionada("papel"),
                child: Image.asset('assets/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcSelecionada("tesoura"),
                child: Image.asset('assets/tesoura.png', height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
