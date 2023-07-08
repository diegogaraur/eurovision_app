import 'package:allesc/models/pais.dart';

class Resultado {
  final String anio;
  final String evento;
  final Pais pais;
  int? puesto;
  int? puntosJurado;
  int? puntosTelevoto;
  int? puntosTotal;

  Resultado(
    this.anio,
    this.evento,
    this.pais,
  );

  @override
  String toString() {
    return "Resultado(anio: $anio, evento: $evento, pais: $pais, puesto: $puesto)";
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is Resultado &&
        other.anio == anio &&
        other.evento == evento &&
        other.pais == pais &&
        other.puesto == puesto;
  }
}
