import 'dart:convert';

import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const Map<int, int> posicionPuntos = {
  0: 12,
  1: 10,
  2: 8,
  3: 7,
  4: 6,
  5: 5,
  6: 4,
  7: 3,
  8: 2,
  9: 1
};

class UsuarioService extends ChangeNotifier {
  final String _baseUrl = 'prueba-b058b.firebaseio.com';
  final String evento = 'ESC2023';
  Usuario? usuario;
  String? idUsuario;
  bool isLoading = true;
  late Map<String, int> votaciones = {};

  Future iniciarUsuario(idUsuario) async {
    // print(idUsuario);
    this.idUsuario = idUsuario;
    final url = Uri.https(_baseUrl, 'usuarios/$idUsuario.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> usuarioMap = json.decode(respuesta.body);
    // print(usuarioMap);
    usuario = Usuario.fromJson(usuarioMap);
    // print('Obtenido usuario: ${usu.alias}');
    return null;
  }

  Future cargarVotaciones(evento) async {
    // print('Inicio obtenerVotaciones');
    final url =
        Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$evento.json');
    // print(url);

    // Realizamos la petición
    final respuesta = await http.get(url);
    // print(respuesta.body);

    final List<dynamic> votacionList = json.decode(respuesta.body);
    // print(votacionList.asMap());

    votacionList.asMap().forEach((indice, pais) {
      int puntos = posicionPuntos[indice]!;

      votaciones[pais] = puntos;
    });
    // print(votaciones);
    // print('Fin obtenerVotaciones');
  }
}
