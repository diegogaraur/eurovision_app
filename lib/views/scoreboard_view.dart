import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:allesc/models/models.dart';
import 'package:allesc/services/usuario_service.dart';
import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:allesc/services/services.dart';

// TODO: Falta añadir los tabs Global y Siguiendo en esta página
// TODO: Esconder AppBar y BottomNavBar al scrolear

const Map<int, int> puntosPosicion = {
  12: 0,
  10: 1,
  8: 2,
  7: 3,
  6: 4,
  5: 5,
  4: 6,
  3: 7,
  2: 8,
  1: 9
};

class ScoreboardView extends StatelessWidget {
  const ScoreboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const String evento = 'ESC2023';
    final rankingGlobalService =
        Provider.of<FirebaseService>(context, listen: true);
    final usuarioService = Provider.of<UsuarioService>(context);
    final votacionesProvider = Provider.of<VotacionesProvider>(context);

    usuarioService.cargarVotaciones(evento);
    Map<String, int>? votacionesUsuario = usuarioService.votaciones;
    final List<RankingItem> rankingGlobal = rankingGlobalService.rankingGlobal;

    List<CancionPais> listaTotal = [];
    Map<int, CancionPais> listaVotaciones = {};
    // Si hay votaciones del usuario, añadirlas al ranking global
    for (RankingItem rankingItem in rankingGlobal) {
      if (votacionesUsuario.isNotEmpty) {
        if (votacionesUsuario[rankingItem.codPais] != null) {
          rankingItem.votos = votacionesUsuario[rankingItem.codPais];
          listaVotaciones[puntosPosicion[rankingItem.votos]!] =
              CancionPais(rankingItem.cancion, rankingItem.codPais);
        }
      }

      listaTotal.add(CancionPais(rankingItem.cancion, rankingItem.codPais));
    }

    // print('Lista total: $listaTotal');
    // print('Lista votaciones: $listaVotaciones');
    votacionesProvider.addListaTotal(listaTotal);
    listaVotaciones.forEach((indice, votacion) {
      votacionesProvider.addVotacion(indice, votacion);
    });

    if (rankingGlobalService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Eurovisión 2023',
                  style: Theme.of(context).textTheme.headlineSmall),
              if (votacionesUsuario.isEmpty)
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, 'votar'),
                  icon: const Icon(Icons.how_to_vote_sharp),
                  label: const Text("Votar"),
                )
              else
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, 'votar'),
                  icon: const Icon(Icons.how_to_vote_sharp),
                  label: const Text("Editar votos"),
                )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rankingGlobal.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                // onTap: () => Navigator.pushNamed(context, 'main'),
                child: ESCScoreTile(
                    indice: index + 1, rankingItem: rankingGlobal[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
