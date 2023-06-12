import 'package:allesc/pages/pages.dart';
import 'package:allesc/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComprobarAuthPage extends StatelessWidget {
  const ComprobarAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.leerIdToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const Text('');
            } else {
              // microtask -> Para navegar una vez se haya cargado el widget que devuevle
              Future.microtask(() {
                // Esta navegacion especial es para que nos e vea una transición fea al login
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const MainPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            }

            // Esta funcion tiene que devolver un widget ponemos este pora que no de error
            return Container();
          },
        ),
      ),
    );
  }
}
