import 'package:flutter/material.dart';

enum TipoDespesa { ALIMENTACAO, LAZER, TRANSPORTE, SERVICOS, OUTROS }

class Despesa {
  final String id;
  final String titulo;
  final String descricao;
  final double valor;
  final DateTime data;
  final TipoDespesa tipo;

  Despesa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.data,
    required this.tipo,
  });

  colors() {
    if (tipo == TipoDespesa.ALIMENTACAO) {
      return Colors.red;
    } else if (tipo == TipoDespesa.LAZER) {
      return Colors.green;
    } else if (tipo == TipoDespesa.TRANSPORTE) {
      return Colors.blue;
    } else if (tipo == TipoDespesa.SERVICOS) {
      return Colors.amber;
    } else if (tipo == TipoDespesa.OUTROS) {
      return Colors.grey;
    }
  }
}
