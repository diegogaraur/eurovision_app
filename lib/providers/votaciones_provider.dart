import 'package:allesc/echarts_data.dart';
import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';

class VotacionesProvider extends ChangeNotifier {
  List keys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  List votados = [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}];
  List<List<CancionPais>> votables = [[], [], [], [], [], [], [], [], [], []];
  int numVotados = 0;

  void actualizarNumVotados() {
    int contador = 0;
    for (Map v in votados) {
      if (v.isNotEmpty) {
        contador++;
      }
    }

    numVotados = contador;
  }

  void setVotables(List<CancionPais> votablesScoreboard) {
    for (int i = 0; i < votables.length; i++) {
      votables[i] = List.of(votablesScoreboard);
    }
    // print(votables);
  }

  void inicializarCanciones(int indice, CancionPais? cancionPais) {
    if (cancionPais != null) {
      if (cancionPais.cancion != null) {
        votados[indice] = {
          'pais': cancionPais.pais,
          'puntos': indicePuntos[indice],
          'cancion': cancionPais.cancion,
        };

        for (int i = 0; i < votables.length; i++) {
          if (i != indice) {
            votables[i].remove(cancionPais);
          }
        }
      }
    }
  }

  void seleccionaCancion(int indice, CancionPais? cancionPais) {
    // print('Inicio seleccionaCancion');
    // print('$indice - $cancionPais');
    if (cancionPais != null) {
      // print('${votados.length} - $votados');
      // print(votables.length);
      if (cancionPais.cancion != null) {
        votados[indice] = {
          'pais': cancionPais.pais,
          'puntos': indicePuntos[indice],
          'cancion': cancionPais.cancion,
        };

        for (int i = 0; i < votables.length; i++) {
          if (i != indice) {
            votables[i].remove(cancionPais);
          }
        }
      } else {
        votados[indice] = {};
      }
    }
    actualizarNumVotados();
    print(votados);
    notifyListeners();
    // print('Fin seleccionaCancion');
  }
}
