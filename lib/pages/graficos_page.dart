import 'package:allesc/widgets/charts/charts.dart';
import 'package:allesc/models/models.dart';
import 'package:allesc/providers/graficos_provider.dart';
import 'package:allesc/services/services.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficosPage extends StatefulWidget {
  const GraficosPage({Key? key}) : super(key: key);

  @override
  State<GraficosPage> createState() => _GraficosPageState();
}

class _GraficosPageState extends State<GraficosPage> {
  @override
  void initState() {
    Provider.of<GraficosService>(context, listen: false).obtenerDatosGraficos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final graficosProvider =
        Provider.of<GraficosProvider>(context, listen: false);
    final graficosService =
        Provider.of<GraficosService>(context, listen: false);
    Pais paisSeleccionado = graficosProvider.paisSeleccionado;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Divider(height: 1),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Puestos (2013 - 2023)',
            contenido: const LineChartPuestos(),
          ),
          const Divider(height: 0.5),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Jurado vs Televoto (2016 - 2023)',
            contenido: const BarChart2(),
          ),
          const Divider(height: 0.5),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Porcentajes posiciones (2013 - 2023)',
            contenido: const PieChartSample2(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ListView.builder(
                itemCount: graficosService.listaPaisesGraficos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      children: [
                        if (graficosService
                                .listaPaisesGraficos[index].codPais !=
                            '')
                          CountryFlag.fromCountryCode(
                              graficosService
                                  .listaPaisesGraficos[index].codPais,
                              height: 20,
                              width: 24),
                        const SizedBox(width: 8),
                        Text(graficosService.listaPaisesGraficos[index].nombre)
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        paisSeleccionado =
                            graficosService.listaPaisesGraficos[index];
                        graficosProvider.paisSeleccionado = paisSeleccionado;
                        graficosProvider.notifyListeners();
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        label: Row(
          children: [
            CountryFlag.fromCountryCode(paisSeleccionado.codPais,
                height: 20, width: 24),
            const SizedBox(width: 8),
            Text(
              paisSeleccionado.nombre,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
