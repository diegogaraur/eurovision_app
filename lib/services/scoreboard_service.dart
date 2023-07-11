import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScoreboardService extends ChangeNotifier {
  final String _baseUrl = 'prueba-b058b.firebaseio.com';
  final String evento = 'ESC2023';
  String anio = '2023';
  List scoreboardGlobal = [];
  bool isLoading = true;

  Future obtenerDatosScoreboard() async {
    print('Inicio obtenerDatosScoreboard');
    // isLoading = true;
    // notifyListeners();

    scoreboardGlobal = [];

    final urlParticipantes =
        Uri.https(_baseUrl, 'participantes/$anio/ALL.json');
    final respuestaParticipantes = await http.get(urlParticipantes);
    final List participantes = json.decode(respuestaParticipantes.body);
    // print(participantes);

    final urlScoreboard = Uri.https(_baseUrl, 'scoreboard/$anio/ALL.json');
    final respuestaScoreboard = await http.get(urlScoreboard);
    final Map scoreboard = json.decode(respuestaScoreboard.body);
    // print(scoreboard);

    for (Map participante in participantes) {
      Map scoreboardParticipante = {};
      scoreboardParticipante['pais'] = participante['pais'];
      scoreboardParticipante['cancion'] = participante['cancion'];
      scoreboardParticipante['puntos'] = scoreboard[participante['pais']];
      scoreboardGlobal.add(scoreboardParticipante);
    }
    // print(scoreboardGlobal);

    // Ordenamos lista
    scoreboardGlobal.sort((a, b) => b['puntos'].compareTo(a['puntos']));

    // isLoading = false;
    // notifyListeners();
    print('Fin obtenerDatosScoreboard');

    return scoreboardGlobal;
  }
}
