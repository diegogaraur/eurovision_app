import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _indiceActual = 0;
  String _titulo = 'Scoreboard';

  int get indiceActual => _indiceActual;
  String get titulo => _titulo;

  void cambiarSeccion(int indice) {
    _indiceActual = indice;
    notifyListeners();
  }

  void cambiarTitulo(String titulo) {
    _titulo = titulo;
    notifyListeners();
  }
}
