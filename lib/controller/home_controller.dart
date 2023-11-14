import '../model/entities/despesa.dart';
import '../model/repositories/local_repositorio_despesas.dart';

class HomeController {
  final _repositorio = repositorio;
  List<Despesa> get despesas => _repositorio.despesas;
}
