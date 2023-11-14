import 'package:despesas_app/components/app_bar.dart';
import 'package:despesas_app/controller/home_controller.dart';
import 'package:despesas_app/model/entities/despesa.dart';
import 'package:despesas_app/pages/adicionar_despesa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/formater_utils.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _controller.despesas.length,
        itemBuilder: (ctx, index) {
          final despesa = _controller.despesas[index];
          return Card(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: Container(
              child: ListTile(
                title: Text(
                  despesa.titulo,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("R\$${despesa.valor.toStringAsFixed(2)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15))),
                subtitle: Text(DateFormat().toBR(despesa.data)),
                trailing: Container(
                  color: despesa.colors(),
                  width: 5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
