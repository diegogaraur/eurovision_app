import 'package:allesc/providers/navigation_bar_provider.dart';
import 'package:allesc/views/views.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBarProvider = Provider.of<NavigationBarProvider>(context);

    return Scaffold(
      appBar: ESCAppBar(titulo: navigationBarProvider.titulo),
      body: [
        const ScoreboardView(),
        const DatosView(),
        const TopsView(),
        const PerfilView(),
      ][navigationBarProvider.indiceActual],
      bottomNavigationBar: const ESCNarvigationBar(),
    );
  }
}
