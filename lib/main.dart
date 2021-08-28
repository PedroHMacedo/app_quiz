import 'package:app_perguntas/Model/Models.dart';

import './questionario.dart';
import 'package:app_perguntas/resultado.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  PerguntasAppState createState() {
    return PerguntasAppState();
  }
}

class PerguntasAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    PerguntaModel('Adivinhe a minha cor favorita?', [
      RespostaModel('Preto', 5),
      RespostaModel('Verde', 3),
      RespostaModel('Branco', 1),
      RespostaModel('Azul', 10),
    ]),
    PerguntaModel('Adivinhe o meu animal favorito?', [
      RespostaModel('Cobra', 5),
      RespostaModel('Leão', 10),
      RespostaModel('Elefante', 3),
      RespostaModel('Coelho', 1),
    ]),
    PerguntaModel('Adivinhe o meu esporte favorito?', [
      RespostaModel('Handebol', 3),
      RespostaModel('Luta', 5),
      RespostaModel('Futebol', 10),
      RespostaModel('Basquete', 1),
    ])
  ];

  void _responder(int pontuacao) {
    if (temPergSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario () {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPergSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Quiz')),
      ),
      body: temPergSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              resposta: _responder)
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}
