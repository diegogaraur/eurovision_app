import 'dart:convert';

import 'package:allesc/echarts_data.dart';
import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GraficosService extends ChangeNotifier {
  final String _baseUrl = 'prueba-b058b.firebaseio.com';
  Map<String, dynamic> datosGraficos = {};
  // late List<Pais> listaPaisesGraficos = [Pais('', 'General')];
  late List<Pais> listaPaisesGraficos = [];
  bool isLoading = true;

  Future obtenerDatosGraficos() async {
    print('Inicio obtenerDatosGraficos');
    // isLoading = true;
    // notifyListeners();

    final url = Uri.https(_baseUrl, 'graficos.json');
    final respuesta = await http.get(url);
    datosGraficos = json.decode(respuesta.body);

    List<String> paisesGraficos = datosGraficos.keys.toList();
    for (String nombrePais in paisesGraficos) {
      if (paisCodigo[nombrePais] != null) {
        listaPaisesGraficos.add(Pais(paisCodigo[nombrePais] ?? '', nombrePais));
      }
    }

    // print(listaPaisesGraficos);

    // isLoading = false;
    // notifyListeners();
    print('Fin obtenerDatosGraficos');

    return datosGraficos;
  }
}
