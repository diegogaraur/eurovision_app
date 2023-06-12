import 'package:allesc/providers/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ESCNarvigationBar extends StatelessWidget {
  const ESCNarvigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarProvider navigationBarProvider =
        Provider.of<NavigationBarProvider>(context);

    return NavigationBar(
      height: 64,
      selectedIndex: navigationBarProvider.indiceActual,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.view_list_sharp),
          icon: Icon(Icons.view_list_outlined),
          label: 'Scoreboard',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bar_chart_sharp),
          icon: Icon(Icons.bar_chart_outlined),
          label: 'Datos',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.swipe_vertical_sharp),
          icon: Icon(Icons.swipe_vertical_outlined),
          label: 'Tops',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.account_circle_sharp),
          icon: Icon(Icons.account_circle_outlined),
          label: 'Mi perfil',
        ),
      ],
      onDestinationSelected: (int indice) {
        navigationBarProvider.cambiarSeccion(indice);
        switch (indice) {
          case 0:
            {
              navigationBarProvider.cambiarTitulo('Scoreboard');
            }
            break;
          case 1:
            {
              navigationBarProvider.cambiarTitulo('Datos');
            }
            break;
          case 2:
            {
              navigationBarProvider.cambiarTitulo('Tops');
            }
            break;
          case 3:
            {
              navigationBarProvider.cambiarTitulo('Mi perfil');
            }
            break;
        }
      },
    );
  }
}
