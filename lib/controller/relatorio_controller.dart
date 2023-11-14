import '../model/entities/despesa.dart';
import '../model/repositories/local_repositorio_despesas.dart';

class RelatorioDespesas {
  final _repositorio = repositorio;

  List<Despesa> get despesas => _repositorio.despesas;

  double? total() {
    var total = 0.0;

    for (var despesa in despesas) {
      total += despesa.valor;
    }

    return total;
  }

  double? ultimos() {
    var total = 0.0;
    var hoje = DateTime.now();
    var limite = hoje.subtract(Duration(days: 30));

    for (var despesa in despesas) {
      if (despesa.data.isAfter(limite) && (despesa.data.isBefore(hoje))) {
        total += despesa.valor;
      }
    }

    return total;
  }

  Despesa? maior() {
    Despesa? maiorDespesa;

    for (var despesa in despesas) {
      if (maiorDespesa == null || despesa.valor > maiorDespesa.valor) {
        maiorDespesa = despesa;
      }
    }

    return maiorDespesa;
  }
}
