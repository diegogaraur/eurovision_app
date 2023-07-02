import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';

class GraficosProvider extends ChangeNotifier {
  Pais paisSeleccionado = Pais('ES', 'Spain');
  List posiciones = [
    {'anio': "2013", 'valor': (26 - 25) / 26 * 100 + 1, 'posicion': 25},
    {'anio': "2014", 'valor': (26 - 10) / 26 * 100 + 1, 'posicion': 10},
    {'anio': "2015", 'valor': (26 - 21) / 26 * 100 + 1, 'posicion': 21},
    {'anio': "2016", 'valor': (26 - 22) / 26 * 100 + 1, 'posicion': 22},
    {'anio': "2017", 'valor': (26 - 26) / 26 * 100 + 1, 'posicion': 26},
    {'anio': "2018", 'valor': (26 - 23) / 26 * 100 + 1, 'posicion': 23},
    {'anio': "2019", 'valor': (26 - 22) / 26 * 100 + 1, 'posicion': 22},
    {'anio': "2021", 'valor': (26 - 24) / 26 * 100 + 1, 'posicion': 24},
    {'anio': "2022", 'valor': (26 - 3) / 26 * 100 + 1, 'posicion': 3},
    {'anio': "2023", 'valor': (26 - 17) / 26 * 100 + 1, 'posicion': 17},
  ];
}
