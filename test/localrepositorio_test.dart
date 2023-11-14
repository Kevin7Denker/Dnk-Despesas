import 'package:despesas_app/model/repositories/local_repositorio_despesas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Cria 20 despesas aleatórias", () {
    final repositorio = LocalRepositorioDespesa();

    expect(repositorio.despesas.length, 20);
  });
}
