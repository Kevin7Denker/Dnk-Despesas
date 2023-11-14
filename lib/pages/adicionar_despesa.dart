import 'dart:js';

import 'package:despesas_app/controller/adiciona_despesa_controller.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../model/entities/despesa.dart';

class AddDespesa extends StatelessWidget {
  final Function goToHome;

  AddDespesa({required this.goToHome});

  final _controller = AdicionaDespesaController();
  final _formKey = GlobalKey<FormState>();

  _cadastrar(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.cadastrar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Cadastrado...")));
      goToHome();
    }
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
              "Adicionar Despesa",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: _controller.validarTitulo,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Título"),
                    onSaved: (value) {
                      _controller.titulo = value ?? "";
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Descrição"),
                    onSaved: (value) {
                      _controller.descricao = value ?? "";
                    },
                  ),
                  TextFormField(
                    validator: _controller.validarValor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Valor R\$"),
                    onSaved: (value) {
                      _controller.valor = double.parse(value ?? "");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InputDatePickerFormField(
                      fieldLabelText: "Data",
                      firstDate: DateTime(2023),
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      onDateSubmitted: (value) {
                        _controller.data = value;
                      },
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Tipo",
                    ),
                    items: TipoDespesa.values.map((tipo) {
                      return DropdownMenuItem(
                        child: Text(tipo.name),
                        value: tipo,
                      );
                    }).toList(),
                    onChanged: (item) {
                      _controller.tipo = item ?? TipoDespesa.OUTROS;
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
              ),
              onPressed: () {
                _cadastrar(context);
              },
              child: Text(
                "Cadastrar",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
