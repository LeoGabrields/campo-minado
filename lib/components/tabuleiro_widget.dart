import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

import '../models/campo_model.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlbernarMarcacao;

  const TabuleiroWidget({
    Key? key,
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlbernarMarcacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: tabuleiro.colunas,
      children: tabuleiro.campos.map((campo) {
        return CampoWidget(
          campo: campo,
          onAbrir: onAbrir,
          onAlbernarMarcacao: onAlbernarMarcacao,
        );
      }).toList(),
    );
  }
}
