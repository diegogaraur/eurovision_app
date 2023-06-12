import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyB6oKISsmY89cW08OOdjLCi19RM4YWzWtk';
  final storage = const FlutterSecureStorage();

  Future<String?> crearUsuario(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final respuesta = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeRespuesta = json.decode(respuesta.body);

    if (decodeRespuesta.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'idToken', value: decodeRespuesta['idToken']);
      return null;
    } else {
      return decodeRespuesta['error']['message'];
    }
  }

  Future<String?> iniciarSesion(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final respuesta = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeRespuesta = json.decode(respuesta.body);

    if (decodeRespuesta.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'idToken', value: decodeRespuesta['idToken']);
      return null;
    } else {
      return decodeRespuesta['error']['message'];
    }
  }

  Future cerrarSesion() async {
    await storage.delete(key: 'idToken');
    return null;
  }

  Future<String> leerIdToken() async {
    return await storage.read(key: 'idToken') ?? '';
  }
}
