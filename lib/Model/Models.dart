class PerguntaModel {
  final String texto;
  final List <RespostaModel> respostas;

  PerguntaModel(this.texto, this.respostas);
}

class RespostaModel {
  final String texto;
  final int pontuacao;

  RespostaModel(this.texto, this.pontuacao);
}