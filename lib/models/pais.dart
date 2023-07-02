class Pais {
  String? codPais;
  String? nombre;

  Pais(this.codPais, this.nombre);

  @override
  String toString() {
    return "Votacion(codPais: $codPais, codPais: $nombre)";
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is Pais && other.nombre == nombre && other.codPais == codPais;
  }
}
