import 'package:allesc/models/models.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class ESCScoreTile extends StatelessWidget {
  final int indice;
  final RankingItem rankingItem;

  const ESCScoreTile({
    Key? key,
    required this.indice,
    required this.rankingItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      title: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            color: indice == 1
                ? Colors.yellow[400]
                : Theme.of(context).colorScheme.tertiaryContainer,
            child: Center(
              child: Text(
                '$indice',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: indice == 1
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 32,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(children: [
                const SizedBox(
                  width: 8,
                ),
                CountryFlag.fromCountryCode(rankingItem.codPais ?? 'ES',
                    height: 24, width: 36),
                const SizedBox(width: 8),
                Text(
                  rankingItem.cancion,
                  style: const TextStyle(fontSize: 16),
                ),
              ]),
            ),
          ),
          Container(
            height: 32,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Text(
                  rankingItem.puntos.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
        ],
      ),
      // trailing: Text(
      //   puntuacion,
      //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      // ),
      // Chip(
      //   padding: EdgeInsets.zero,
      //   label: Text(
      //     puntuacion,
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
