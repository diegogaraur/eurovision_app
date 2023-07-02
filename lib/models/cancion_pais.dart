class CancionPais {
  String? cancion;
  String? codPais;

  CancionPais(this.cancion, this.codPais);

  @override
  String toString() {
    return "Votacion(cancion: $cancion, codPais: $codPais)";
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is CancionPais &&
        other.cancion == cancion &&
        other.codPais == codPais;
  }
}
