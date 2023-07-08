import 'dart:convert';

import 'package:allesc/models/models.dart';
import 'package:allesc/models/ranking_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class FirebaseService extends ChangeNotifier {
  final String _baseUrl = 'prueba-b058b.firebaseio.com';
  final String evento = 'ESC2023';
  List<RankingItem> rankingGlobal = [];
  Map<String, dynamic>? datosGraficos;
  bool isLoading = true;
  bool isLoadingGraficos = true;
  final storage = const FlutterSecureStorage();

  FirebaseService() {
    cargarRankingGlobal(evento);
  }

  Future cargarRankingGlobal(evento) async {
    isLoading = true;
    notifyListeners();

    rankingGlobal = [];

    // Montamos la url del objeto y le añadimos el token de autenticación
    // final url = Uri.https(_baseUrl, 'r_global/ESC2023.json',
    //     {'auth': await storage.read(key: 'idToken') ?? ''});
    final url = Uri.https(_baseUrl, 'r_global/$evento.json');

    // Realizamos la petición
    final respuesta = await http.get(url);

    // Obtenemos el json de la petición
    final Map<String, dynamic> rankingGlobalMap = json.decode(respuesta.body);

    // if (rankingGlobalMap["error"] == "Permission denied") {
    //   isLoading = false;
    //   notifyListeners();
    //   return null;
    // }

    // print(rankingGlobalMap);

    // Pasamos de json a lista
    rankingGlobalMap.forEach((key, value) {
      final tempRankingItem = RankingItem.fromJson(value);
      tempRankingItem.codPais = key;
      rankingGlobal.add(tempRankingItem);
    });

    rankingGlobal.sort((a, b) => b.puntos.compareTo(a.puntos));

    isLoading = false;
    notifyListeners();

    return rankingGlobal;
  }
}
