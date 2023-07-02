import 'package:allesc/models/models.dart';

class Votacion {
  final int puntos;
  CancionPais? cancionPais;

  Votacion(this.puntos, this.cancionPais);

  @override
  String toString() {
    return "Votacion(puntos: $puntos, cancionPais: $cancionPais)";
  }
}
