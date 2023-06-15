import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:allesc/widgets/widgets.dart';
import 'package:allesc/services/services.dart';

class ScoreboardView extends StatelessWidget {
  const ScoreboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final rankingGlobalService = Provider.of<RankingGlobalService>(context);
    final List<RankingItem> rankingGlobal = rankingGlobalService.rankingGlobal;

    if (rankingGlobalService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: rankingGlobal.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'main'),
        child:
            ESCScoreTile(indice: index + 1, rankingItem: rankingGlobal[index]),
      ),
    );

    // return ListView(
    //   shrinkWrap: true,
    //   children: const [
    //     ESCScoreTile(indice: 1, iso: 'SE', pais: 'Tattoo', puntuacion: '520'),
    //     ESCScoreTile(
    //         indice: 2, iso: 'FI', pais: 'Cha Cha Cha', puntuacion: '415'),
    //     ESCScoreTile(
    //         indice: 3, iso: 'UA', pais: 'Heart Of Steel', puntuacion: '357'),
    //     ESCScoreTile(
    //         indice: 4, iso: 'NO', pais: 'Queen Of Kings', puntuacion: '312'),
    //     ESCScoreTile(indice: 5, iso: 'ES', pais: 'EaEa', puntuacion: '223'),
    //     ESCScoreTile(
    //         indice: 6,
    //         iso: 'AT',
    //         pais: 'Who The Hell Is Edgar?',
    //         puntuacion: '218'),
    //     ESCScoreTile(
    //         indice: 7, iso: 'FR', pais: 'Évidemment', puntuacion: '217'),
    //     ESCScoreTile(indice: 8, iso: 'IL', pais: 'Unicorn', puntuacion: '186'),
    //     ESCScoreTile(indice: 9, iso: 'IT', pais: 'Due Vite', puntuacion: '169'),
    //     ESCScoreTile(
    //         indice: 10,
    //         iso: 'CZ',
    //         pais: 'My Sister\'s Crown',
    //         puntuacion: '159'),
    //     ESCScoreTile(
    //         indice: 11, iso: 'AM', pais: 'Future Lover', puntuacion: '146'),
    //     ESCScoreTile(
    //         indice: 12, iso: 'MD', pais: 'Soarele şi Luna', puntuacion: '146'),
    //     ESCScoreTile(
    //         indice: 13, iso: 'CH', pais: 'Watergun', puntuacion: '131'),
    //     ESCScoreTile(
    //         indice: 14, iso: 'RS', pais: 'Samo mi se spava', puntuacion: '124'),
    //     ESCScoreTile(indice: 15, iso: 'GE', pais: 'Echo', puntuacion: '115'),
    //     ESCScoreTile(indice: 16, iso: 'AU', pais: 'Promise', puntuacion: '114'),
    //     ESCScoreTile(
    //         indice: 17, iso: 'HR', pais: 'Mama ŠČ!', puntuacion: '107'),
    //     ESCScoreTile(
    //         indice: 18, iso: 'BE', pais: 'Because Of You', puntuacion: '97'),
    //     ESCScoreTile(
    //         indice: 19, iso: 'GB', pais: 'I Wrote A Song', puntuacion: '96'),
    //   ],
    // );
  }
}
