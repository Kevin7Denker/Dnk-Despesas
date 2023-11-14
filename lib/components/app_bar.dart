import 'package:despesas_app/pages/adicionar_despesa.dart';
import 'package:despesas_app/pages/home.dart';
import 'package:despesas_app/pages/relatorio.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [];
  _goToHome() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions
        .addAll([Home(), AddDespesa(goToHome: _goToHome), Relatorio()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Banco PicPay",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.green[600],
        scrolledUnderElevation: 4.0,
        toolbarHeight: 70,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,
        backgroundColor: Colors.green[600],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                weight: 700.0,
                size: 25,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                weight: 700.0,
                size: 25,
                color: Colors.white,
              ),
              label: "Adicionar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.folder,
                size: 25,
                color: Colors.white,
              ),
              label: "Relatorio"),
        ],
      ),
    );
  }
}
