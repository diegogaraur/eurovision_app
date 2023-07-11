import 'package:allesc/echarts_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:allesc/models/models.dart';
import 'package:allesc/services/usuario_service.dart';
import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:allesc/services/services.dart';

// TODO: Falta añadir los tabs Global y Siguiendo en esta página
// TODO: Esconder AppBar y BottomNavBar al scrolear

class ScoreboardView extends StatefulWidget {
  const ScoreboardView({super.key});

  @override
  State<ScoreboardView> createState() => _ScoreboardViewState();
}

class _ScoreboardViewState extends State<ScoreboardView> {
  @override
  Widget build(BuildContext context) {
    List votacionesUsuario = [];

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
            child: FutureBuilder(
              future: Provider.of<ScoreboardService>(context, listen: false)
                  .obtenerDatosScoreboard(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List datosScoreboard = snapshot.data;
                  List votacionesUsuario =
                      Provider.of<UsuarioService>(context, listen: false)
                          .votaciones;
                  List<CancionPais> votables = [];
                  votables.add(CancionPais(null, null));
                  List votos = [];
                  for (Map dato in datosScoreboard) {
                    votables.add(CancionPais(dato['cancion'], dato['pais']));
                    for (Map votacion in votacionesUsuario) {
                      if (dato['pais'] == votacion['pais']) {
                        votos.add(votacion['puntos']);
                      }
                    }
                    votos.add(null);
                  }
                  // print(votacionesUsuario);
                  // for (Map votacion in votacionesUsuario) {
                  //   votables.remove(
                  //       CancionPais(votacion['cancion'], votacion['pais']));
                  // }

                  // Ordenamos lista por ordern alfabeticp
                  // votables.sort((a, b) => b.compareTo(a));

                  Provider.of<VotacionesProvider>(context, listen: false)
                      .setVotables(votables);

                  if (datosScoreboard.isEmpty) {
                    return const Center(child: Text('Sin canciones'));
                  } else {
                    return ListView.builder(
                      itemCount: datosScoreboard.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ESCScoreTile(
                        indice: index + 1,
                        rankingItem: RankingItem(
                          cancion: datosScoreboard[index]['cancion'],
                          codPais: paisCodigo[datosScoreboard[index]['pais']],
                          puntos: datosScoreboard[index]['puntos'],
                          // votos: votos[index],
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
