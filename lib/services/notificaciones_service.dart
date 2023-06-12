import 'package:flutter/material.dart';

class NotificacionesService {
  static GlobalKey<ScaffoldMessengerState> messenserKey =
      GlobalKey<ScaffoldMessengerState>();

  static mostrarSnackbar(String mensaje) {
    final snackBar = SnackBar(
        content: Text(
      mensaje,
    ));

    messenserKey.currentState!.showSnackBar(snackBar);
  }
}
