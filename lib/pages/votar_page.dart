import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotarPage extends StatelessWidget {
  const VotarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Usar un provider para la votación para mantener el estado de canciones seleccionadas
    final votacionesProvider = Provider.of<VotacionesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Votar'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Eurovisión 2023',
                    style: Theme.of(context).textTheme.headlineSmall),
                Text('${votacionesProvider.votaciones.length}/10')
              ],
            ),
            const SizedBox(height: 16),
            // Column(
            //   children: List.generate(10, (indice) {
            //     return ESCRow(
            //       indice: indice,
            //       puntos: votacionesProvider.votaciones[indice].puntos,
            //       canciones: votacionesProvider.candidatos,
            //       valor: votacionesProvider.votaciones[indice].cancionPais,
            //     );
            //   }),
            // ),
            const ESCRow(indice: 0),
            const ESCRow(indice: 1),
            const ESCRow(indice: 2),
            const ESCRow(indice: 3),
            const ESCRow(indice: 4),
            const ESCRow(indice: 5),
            const ESCRow(indice: 6),
            const ESCRow(indice: 7),
            const ESCRow(indice: 8),
            const ESCRow(indice: 9),
            // ESCRow(puntos: 10, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 8, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 7, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 6, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 5, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 4, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 3, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 2, canciones: votacionesProvider.candidatos),
            // ESCRow(puntos: 1, canciones: votacionesProvider.candidatos),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                // TODO: Buscar como evitar que aparezca el icono de volver en la página de Scoreboard
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'main'),
                icon: const Icon(Icons.send),
                label: const Text("Enviar votos"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
