import 'package:despesas_app/controller/relatorio_controller.dart';
import 'package:despesas_app/model/repositories/repositorio_despesas.dart';
import 'package:flutter/material.dart';

class Relatorio extends StatefulWidget {
  const Relatorio({super.key});

  @override
  State<Relatorio> createState() => _Relatorio();
}

class _Relatorio extends State<Relatorio> {
  final _controller = RelatorioDespesas();

  String? maiorTitulo() {
    var maiorTitulo = _controller.maior();
    return maiorTitulo?.titulo;
  }

  String? maiorDescricao() {
    var maiorTitulo = _controller.maior();
    return maiorTitulo?.descricao;
  }

  double? maiorValor() {
    var maiorTitulo = _controller.maior();
    return maiorTitulo?.valor;
  }

  DateTime? maiorData() {
    var maiorTitulo = _controller.maior();
    return maiorTitulo?.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Relatorio",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                    width: 450,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Valor Total Gasto",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "R\$ ${_controller.total()}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    )),
                color: Color.fromARGB(145, 75, 222, 83),
              )),
          Container(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  width: 450,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gasto Nos Ultimos 30 Dias",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "R\$ ${_controller.ultimos()}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Color.fromARGB(145, 75, 222, 83),
              )),
          Container(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  width: 450,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Maior Despesa",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Nome: ${maiorTitulo()}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Descrição: ${maiorDescricao()}",
                                      style: TextStyle(fontSize: 12)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Valor: ${maiorValor()}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Data: ${maiorData()}",
                                      style: TextStyle(fontSize: 12)),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                color: Color.fromARGB(145, 75, 222, 83),
              )),
          //ElevatedButton(onPressed: , child: Text("A"))
        ],
      ),
    );
  }
}
