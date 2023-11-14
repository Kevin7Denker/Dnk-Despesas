import 'dart:math';

import '../entities/despesa.dart';

import './repositorio_despesas.dart';

List<Despesa> _gerarDespesasFake(int qtde) {
  List<Despesa> lista = [];
  final rand = Random(DateTime.now().millisecondsSinceEpoch);

  for (int i = 0; i < qtde; i++) {
    String id = "00$i";
    String titulo = "Despesa 00$i";
    String descricao = "Uma despesa 00$i. Uma despesa 00$i";
    double valor = rand.nextDouble() * 100;
    DateTime data = DateTime.now().add(Duration(days: -rand.nextInt(10)));
    TipoDespesa tipo =
        TipoDespesa.values[rand.nextInt(TipoDespesa.values.length)];

    lista.add(Despesa(
      id: id,
      titulo: titulo,
      descricao: descricao,
      valor: valor,
      data: data,
      tipo: tipo,
    ));
  }
  return lista;
}

class LocalRepositorioDespesa implements RepositorioDespesas {
  final List<Despesa> _despesas = [];

  LocalRepositorioDespesa() {
    _despesas.addAll(_despesas);
  }

  @override
  // TODO: implement despesas
  List<Despesa> get despesas => List.unmodifiable(_gerarDespesasFake(5));

  @override
  void adicionar(Despesa despesa) {
    _despesas.add(despesa);
  }
}

final repositorio = LocalRepositorioDespesa();
