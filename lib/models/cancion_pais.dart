class CancionPais {
  String? cancion;
  String? pais;

  CancionPais(this.cancion, this.pais);

  @override
  String toString() {
    return "Votacion(cancion: $cancion, pais: $pais)";
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is CancionPais &&
        other.cancion == cancion &&
        other.pais == pais;
  }
}
