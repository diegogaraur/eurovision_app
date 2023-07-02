import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';

class VotacionesProvider extends ChangeNotifier {
  List<Votacion> votaciones = [
    Votacion(12, null),
    Votacion(10, null),
    Votacion(8, null),
    Votacion(7, null),
    Votacion(6, null),
    Votacion(5, null),
    Votacion(4, null),
    Votacion(3, null),
    Votacion(2, null),
    Votacion(1, null),
  ];
  List<CancionPais> listaTotal = [];
  List<List<CancionPais>> listasVotables = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];

  addListaTotal(List<CancionPais> lista) {
    // print('Inicio addListaTotal');
    // Actualizmaos la lista completa de canciones
    listaTotal = lista;

    // Actualizamos las listas de canciones votables
    for (List<CancionPais> listaVotable in listasVotables) {
      listaVotable.clear();
      listaVotable.addAll(listaTotal);
    }

    eliminarCancionVotables();
    // print('Fin addListaTotal');
  }

  eliminarCancionVotables() {
    // Para cada votacion no nula, eliminar de las listas que no tenga la misma posicion la cancionPais
    votaciones.asMap().forEach((indiceVotacion, votacion) {
      if (votacion.cancionPais != null) {
        listasVotables.asMap().forEach((indiceVotable, listaVotable) {
          if (indiceVotacion != indiceVotable) {
            listaVotable.clear();
            listaVotable.addAll(listaTotal);
            listaVotable.remove(votacion.cancionPais);
          }
        });
      }
    });
  }

  addVotacion(int indice, CancionPais votacion) {
    votaciones[indice].cancionPais = votacion;

    eliminarCancionVotables();
  }
}
