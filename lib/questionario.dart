import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/respostas.dart';
import 'package:flutter/material.dart';

import 'Model/Models.dart';

class Questionario extends StatelessWidget {
  final List<PerguntaModel> perguntas;
  final int perguntaSelecionada;
  final void Function(int) resposta;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.resposta,
  });

  bool get temPergSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<RespostaModel> respostas =
        temPergSelecionada ? perguntas[perguntaSelecionada].respostas : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada].texto),
        ...respostas
            .map(
                (resp) => Respostas(resp.texto, () => resposta(resp.pontuacao)))
            .toList(),
      ],
    );
  }
}
