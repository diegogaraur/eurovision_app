import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String nombre;
  String alias;
  String biografia;
  String pais;
  List<dynamic>? seguidores;
  List<dynamic>? siguiendo;

  Usuario({
    required this.nombre,
    required this.alias,
    required this.biografia,
    required this.pais,
    this.seguidores,
    this.siguiendo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["Nombre"],
        alias: json["alias"],
        biografia: json["biografia"],
        pais: json["pais"],
        seguidores: json["seguidores"],
        siguiendo: json["siguiendo"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "alias": alias,
        "biografia": biografia,
        "pais": pais,
        "seguidores": seguidores,
        "siguiendo": siguiendo,
      };
}
