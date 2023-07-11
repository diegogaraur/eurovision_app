import 'dart:convert';

import 'package:allesc/models/models.dart';
import 'package:allesc/widgets/esc_dropdown.dart';
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
  Usuario? usuario;
  String? idUsuario;
  bool isLoading = true;
  // late Map<String, int> votaciones = {};
  List votaciones = [];

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

  // Future cargarVotaciones(evento) async {
  //   // print('Inicio obtenerVotaciones');
  //   final url =
  //       Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$evento.json');
  //   // print(url);

  //   // Realizamos la petición
  //   final respuesta = await http.get(url);
  //   // print(respuesta.body);

  //   final List<dynamic> votacionList = json.decode(respuesta.body);
  //   // print(votacionList.asMap());

  //   votacionList.asMap().forEach((indice, pais) {
  //     int puntos = posicionPuntos[indice]!;

  //     votaciones[pais] = puntos;
  //   });
  //   // print(votaciones);
  //   // print('Fin obtenerVotaciones');
  // }

  Future obtenerVotacionesUsuario(anio) async {
    print('Inicio obtenerVotacionesUsuario');
    votaciones = [];

    final url =
        Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$anio/ALL.json');
    final respuesta = await http.get(url);
    final listaVotaciones = json.decode(respuesta.body);

    votaciones = listaVotaciones;

    print('Fin obtenerVotacionesUsuario');
    return votaciones;
  }

  Future guardarVotacionesUsuario(int anio, List votados) async {
    print('Inicio guardarVotacionesUsuario');

    bool vacio = true;
    for (Map voto in votados) {
      if (voto.isNotEmpty) {
        vacio = false;
        break;
      }
    }

    if (vacio) {
      votados = [];
    }

    final url =
        Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$anio/ALL.json');
    final respuesta = await http.put(url, body: json.encode(votados));
    print(json.decode(respuesta.body));

    print('Fin guardarVotacionesUsuario');
    return null;
  }
}
