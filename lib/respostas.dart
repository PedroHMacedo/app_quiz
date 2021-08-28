import 'dart:ui';

import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String respostaTexto;
  final void Function() quandoSelecionado;
  

  Respostas(this.respostaTexto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            onPressed: quandoSelecionado,
            child: Text(respostaTexto)),
      ),
    );
  }
}
