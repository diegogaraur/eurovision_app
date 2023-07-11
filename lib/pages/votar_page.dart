import 'package:allesc/models/models.dart';
import 'package:allesc/pages/pages.dart';
import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/services/services.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotarPage extends StatefulWidget {
  const VotarPage({Key? key}) : super(key: key);

  @override
  State<VotarPage> createState() => _VotarPageState();
}

class _VotarPageState extends State<VotarPage> {
  @override
  void initState() {
    // print(Provider.of<VotacionesProvider>(context, listen: false).votados);
    super.initState();
  }

  int numeroVotados() {
    return Provider.of<VotacionesProvider>(context, listen: false)
        .votados
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votar'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: Provider.of<UsuarioService>(context, listen: false)
              .obtenerVotacionesUsuario(2023),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List votacionesUsuarios = snapshot.data;
              // print(votacionesUsuarios);
              final votacionesProvider =
                  Provider.of<VotacionesProvider>(context, listen: false);

              List votados = votacionesProvider.votados;
              for (int i = 0; i < votacionesUsuarios.length; i++) {
                votados[i] = votacionesUsuarios[i];
              }
              votacionesProvider.votados = votados;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Eurovisión 2023',
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text('${votacionesProvider.getLenght()}/10')
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                        children: List.generate(
                            10, (index) => ESCRow(indice: index))),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton.icon(
                        // TODO: Buscar como evitar que aparezca el icono de volver en la página de Scoreboard
                        onPressed: () {
                          final votacionesProvider =
                              Provider.of<VotacionesProvider>(context,
                                  listen: false);
                          final usuarioService = Provider.of<UsuarioService>(
                              context,
                              listen: false);
                          usuarioService.guardarVotacionesUsuario(
                              2023, votacionesProvider.votados);
                          // Navigator.pushReplacementNamed(context, 'main');
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.send),
                        label: const Text("Enviar votos"),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
