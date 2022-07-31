import 'package:flutter/material.dart';
import '../models/campo_model.dart';

class CampoWidget extends StatefulWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlbernarMarcacao;

  const CampoWidget({
    Key? key,
    required this.campo,
    required this.onAbrir,
    required this.onAlbernarMarcacao,
  }) : super(key: key);

  @override
  State<CampoWidget> createState() => _CampoWidgetState();
}

class _CampoWidgetState extends State<CampoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onAbrir(widget.campo),
      onLongPress: () => widget.onAlbernarMarcacao(widget.campo),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    int qtdMinas = widget.campo.qtdeMinasNaVizinhanca;
    if (widget.campo.aberto && widget.campo.minado && widget.campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (widget.campo.aberto && widget.campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (widget.campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdMinas.jpeg');
    } else if (widget.campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
