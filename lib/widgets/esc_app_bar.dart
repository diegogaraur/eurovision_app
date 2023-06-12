import 'package:allesc/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Implementa PreferredSizeWidget que es lo que espera el appbar
class ESCAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String titulo;

  const ESCAppBar({super.key, required this.titulo});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<ESCAppBar> createState() => _ESCAppBarState();
}

class _ESCAppBarState extends State<ESCAppBar> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return AppBar(
      title: Text(widget.titulo),
      centerTitle: true,
      actions: [
        if (widget.titulo == 'Mi perfil')
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () {
              authService.cerrarSesion();
              Navigator.pushReplacementNamed(context, 'login');
            },
          )
      ],
    );
  }
}
