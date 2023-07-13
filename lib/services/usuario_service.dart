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
  Usuario? usuario;
  String? idUsuario;
  bool isLoading = true;
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
    votaciones = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}];

    final url =
        Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$anio/ALL.json');
    final respuesta = await http.get(url);
    final listaVotaciones = json.decode(respuesta.body);

    print(listaVotaciones);
    try {
      listaVotaciones.forEach((k, v) {
        votaciones[int.parse(k)] = v;
      });
    } catch (e) {
      print(e);
    }

    print(votaciones);

    if (listaVotaciones != null) {
      for (int i = 0; i < listaVotaciones.length; i++) {
        if (listaVotaciones[i] != null) {
          votaciones[i] = listaVotaciones[i];
        }
      }
    }

    print(votaciones);

    print('Fin obtenerVotacionesUsuario');
    return votaciones;
  }

  Future guardarVotacionesUsuario(int anio, List votados) async {
    print('Inicio guardarVotacionesUsuario');
    print(votados);

    bool vacio = true;
    for (Map voto in votados) {
      if (voto.isNotEmpty) {
        vacio = false;
        break;
      }
    }

    if (vacio) {
      votados = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}];
    }

    final urlVotacionesUsuario =
        Uri.https(_baseUrl, 'usuarios/$idUsuario/votaciones/$anio/ALL.json');

    // final resVotacionPrevia = await http.get(urlVotacionesUsuario);
    // var votacionPrevia = json.decode(resVotacionPrevia.body);
    // votacionPrevia ??= [];
    // print(votacionPrevia);
    print(votaciones);

    Map puntosGlobales = {};
    for (Map voto in votados) {
      if (voto['pais'] != null) {
        puntosGlobales[voto['pais']] = voto['puntos'];
      }
    }
    print(puntosGlobales);
    for (Map voto in votaciones) {
      if (voto['pais'] != null) {
        if (puntosGlobales.containsKey(voto['pais'])) {
          puntosGlobales[voto['pais']] -= voto['puntos'];
        } else {
          puntosGlobales[voto['pais']] = -voto['puntos'];
        }
      }
    }
    print(puntosGlobales.entries.toList());

    final urlScoreboard = Uri.https(_baseUrl, 'scoreboard/$anio/ALL.json');
    final respuestaScoreboard = await http.get(urlScoreboard);
    Map puntosScoreboard = json.decode(respuestaScoreboard.body);
    print(puntosScoreboard);

    for (MapEntry puntuacion in puntosGlobales.entries.toList()) {
      puntosScoreboard[puntuacion.key] += puntuacion.value;
    }
    print(puntosScoreboard);
    // final resActScoreboard =
    //     await http.put(urlScoreboard, body: json.encode(puntosScoreboard));

    print(json.encode(votados));

    final respuesta =
        await http.put(urlVotacionesUsuario, body: json.encode(votados));
    print(json.decode(respuesta.body));

    print('Fin guardarVotacionesUsuario');
    return null;
  }
}
