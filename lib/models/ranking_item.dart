// To parse this JSON data, do
//
//     final rankingItem = rankingItemFromJson(jsonString);

import 'dart:convert';

Map<String, RankingItem> rankingItemFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, RankingItem>(k, RankingItem.fromJson(v)));

String rankingItemToJson(Map<String, RankingItem> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class RankingItem {
  String cancion;
  String? codPais;
  int puntos;

  RankingItem({
    required this.cancion,
    this.codPais,
    required this.puntos,
  });

  factory RankingItem.fromJson(Map<String, dynamic> json) => RankingItem(
        cancion: json["cancion"] ?? '',
        codPais: json["cod_pais"] ?? '',
        puntos: json["puntos"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "cancion": cancion,
        "cod_pais": codPais,
        "puntos": puntos,
      };
}
