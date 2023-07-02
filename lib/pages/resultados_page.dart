import 'package:allesc/models/models.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  ResultadosPage({Key? key}) : super(key: key);

  final List<RankingItem> resultados = [
    RankingItem(cancion: 'Tattoo', puntos: 583, codPais: 'SE'),
    RankingItem(cancion: 'Cha Cha Cha', puntos: 526, codPais: 'FI'),
    RankingItem(cancion: 'Unicorn', puntos: 362, codPais: 'IL'),
    RankingItem(cancion: 'Due Vite', puntos: 350, codPais: 'IT'),
    RankingItem(cancion: 'Queen Of Kings', puntos: 268, codPais: 'NO'),
    RankingItem(cancion: 'Heart Of Steel', puntos: 243, codPais: 'UA'),
    RankingItem(cancion: 'Because Of You', puntos: 182, codPais: 'BE'),
    RankingItem(cancion: 'Bridges', puntos: 168, codPais: 'EE'),
    RankingItem(cancion: 'Promise', puntos: 151, codPais: 'AU'),
    RankingItem(cancion: 'My Sister\'s Crown', puntos: 129, codPais: 'CZ'),
    RankingItem(cancion: 'Stay', puntos: 127, codPais: 'LT'),
    RankingItem(cancion: 'Break A Broken Heart', puntos: 126, codPais: 'CY'),
    RankingItem(cancion: 'Mama ŠČ!', puntos: 123, codPais: 'HR'),
    RankingItem(cancion: 'Future Lover', puntos: 122, codPais: 'AM'),
    RankingItem(cancion: 'Who The Hell Is Edgar?', puntos: 120, codPais: 'AT'),
    RankingItem(cancion: 'Évidemment', puntos: 104, codPais: 'FR'),
    RankingItem(cancion: 'EaEa', puntos: 100, codPais: 'ES'),
    RankingItem(cancion: 'Soarele şi Luna', puntos: 96, codPais: 'MD'),
    RankingItem(cancion: 'Solo', puntos: 93, codPais: 'PO'),
    RankingItem(cancion: 'Watergun', puntos: 92, codPais: 'CH'),
    RankingItem(cancion: 'Carpe Diem', puntos: 78, codPais: 'SI'),
    RankingItem(cancion: 'Duje', puntos: 76, codPais: 'AL'),
    RankingItem(cancion: 'Ai Coração', puntos: 59, codPais: 'PT'),
    RankingItem(cancion: 'Samo Mi Se Spava', puntos: 30, codPais: 'SB'),
    RankingItem(cancion: 'I Wrote A Song', puntos: 24, codPais: 'GB'),
    RankingItem(cancion: 'Blood & Glitter', puntos: 18, codPais: 'DE'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Eurovisión 2023',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: resultados.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'candidatura'),
                  child: ESCResultadoTile(
                    indice: index + 1,
                    rankingItem: RankingItem(
                      cancion: resultados[index].cancion,
                      codPais: resultados[index].codPais,
                      puntos: resultados[index].puntos,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
