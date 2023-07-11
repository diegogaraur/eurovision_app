import 'package:allesc/echarts_data.dart';
import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';

class VotacionesProvider extends ChangeNotifier {
  // GlobalKey<FormState> votacionKey = GlobalKey<FormState>();
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

  int getLenght() {
    int contador = 0;
    for (Map v in votados) {
      if (v.isNotEmpty) {
        contador++;
      }
    }

    return contador;
  }

  void setVotables(List<CancionPais> votablesScoreboard) {
    for (int i = 0; i < votables.length; i++) {
      votables[i] = List.of(votablesScoreboard);
    }
    // print(votables);
  }

  void inicializarCanciones(int indice, CancionPais? cancionPais) {
    if (cancionPais != null) {
      votados[indice] = {
        'pais': cancionPais.pais,
        'puntos': indicePuntos[indice],
        'cancion': cancionPais.cancion,
      };
    }

    for (int i = 0; i < votables.length; i++) {
      if (i != indice) {
        votables[i].remove(cancionPais);
      }
    }
  }

  void seleccionaCancion(int indice, CancionPais? cancionPais) {
    // print('Inicio seleccionaCancion');
    // print('$indice - $cancionPais');
    if (cancionPais != null) {
      votados[indice] = {
        'pais': cancionPais.pais,
        'puntos': indicePuntos[indice],
        'cancion': cancionPais.cancion,
      };
      // print('${votados.length} - $votados');
      // print(votables.length);
      if (cancionPais.cancion != null) {
        for (int i = 0; i < votables.length; i++) {
          if (i != indice) {
            // print(i);
            // print(votables[i].contains(cancionPais));
            votables[i].remove(cancionPais);
            // print(votables[i]);
          }
        }
      }
    }
    print(votados);
    notifyListeners();
    // print('Fin seleccionaCancion');
  }
}
