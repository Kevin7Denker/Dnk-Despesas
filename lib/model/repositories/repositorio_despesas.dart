import '../entities/despesa.dart';

abstract class RepositorioDespesas {
  List<Despesa> get despesas;

  adicionar(Despesa nova);
}
