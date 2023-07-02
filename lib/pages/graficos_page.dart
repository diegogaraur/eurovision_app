import 'package:allesc/charts/charts.dart';
import 'package:allesc/models/models.dart';
import 'package:allesc/providers/graficos_provider.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficosPage extends StatelessWidget {
  const GraficosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final graficosProvider = Provider.of<GraficosProvider>(context);
    Pais paisSeleccionado = graficosProvider.paisSeleccionado;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // const Divider(height: 1),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Jurado vs Televoto (2016 - 2023)',
            contenido: const BarChart2(),
          ),
          const Divider(height: 0.5),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Puestos (2013 - 2023)',
            contenido: const LineChart2(),
          ),
          const Divider(height: 0.5),
          ESCCardChart(
            pais: paisSeleccionado,
            titulo: 'Porcentajes posiciones (2013 - 2023)',
            contenido: const PieChartSample2(),
          ),
          // const Divider(height: 0.5),
          // ESCCardChart(
          //   codPais: 'ES',
          //   titulo: 'España en Eurovisión (2013 - 2023)',
          //   contenido: BarChartExample(),
          // ),
          // const ESCCardChart(
          //   titulo: 'Ejemplo gráficos',
          //   contenido: ECharts(),
          // ),
          // const Divider(),
          // SizedBox(height: 64),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        label: Row(
          children: [
            CountryFlag.fromCountryCode(paisSeleccionado.codPais!,
                height: 20, width: 24),
            const SizedBox(width: 8),
            Text(
              paisSeleccionado.nombre!,
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
