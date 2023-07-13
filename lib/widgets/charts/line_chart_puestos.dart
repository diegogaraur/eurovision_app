import 'package:allesc/models/models.dart';
import 'package:allesc/providers/graficos_provider.dart';
import 'package:allesc/services/services.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:provider/provider.dart';

class LineChartPuestos extends StatefulWidget {
  const LineChartPuestos({super.key});

  @override
  State<LineChartPuestos> createState() => _LineChartPuestosState();
}

class _LineChartPuestosState extends State<LineChartPuestos> {
  Pais? paisSeleccionado;

  List<TagAnnotation>? crearAnotaciones(BuildContext context, data) {
    GraficosProvider graficosProvider =
        Provider.of<GraficosProvider>(context, listen: true);

    List<TagAnnotation> anotaciones =
        data[graficosProvider.paisSeleccionado.nombre]['line_chart_puestos']
            .map((dynamic map) {
              return TagAnnotation(
                label: Label(
                  '${map['puesto']}',
                  LabelStyle(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                values: [map['anio'], map['valor']],
              );
            })
            .toList()
            .cast<TagAnnotation>();

    return anotaciones;
  }

  @override
  Widget build(BuildContext context) {
    GraficosProvider graficosProvider =
        Provider.of<GraficosProvider>(context, listen: true);
    // Estilos
    Color color = Theme.of(context).colorScheme.onPrimaryContainer;
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 10);

    return FutureBuilder(
      future: Provider.of<GraficosService>(context, listen: false)
          .obtenerDatosGraficos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Map<String, dynamic> data = snapshot.data;
          if (data.isEmpty) {
            return const Center(child: Text('Sin datos'));
          } else {
            return Chart(
              data: data[graficosProvider.paisSeleccionado.nombre]
                  ['line_chart_puestos'],
              variables: {
                'anio': Variable(
                  accessor: (dynamic map) => map['anio'] as String,
                  scale: OrdinalScale(inflate: true),
                ),
                'valor':
                    Variable(accessor: (dynamic map) => map['valor'] as num)
              },
              marks: [
                LineMark(
                  shape: ShapeEncode(value: BasicLineShape()),
                  color: ColorEncode(value: color),
                )
              ],
              axes: [
                // Defaults.horizontalAxis,
                AxisGuide(
                  position: 0.075,
                  label: LabelStyle(
                    textStyle: textStyle,
                    offset: const Offset(0, 7.5),
                  ),
                  // Defaults.vertocalAxis,
                ),
              ],
              annotations: crearAnotaciones(context, data),
            );
          }
        }
      },
    );

    // if (graficosService.isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // } else {
    //   if (graficosProvider.paisSeleccionado.nombre != 'General') {
    //     return Chart(
    //       data: graficosService
    //               .datosGraficos[graficosProvider.paisSeleccionado.nombre]
    //           ['line_chart_puestos'],
    //       variables: {
    //         'anio': Variable(
    //           accessor: (dynamic map) => map['anio'] as String,
    //           scale: OrdinalScale(inflate: true),
    //         ),
    //         'valor': Variable(accessor: (dynamic map) => map['valor'] as num)
    //       },
    //       marks: [
    //         LineMark(
    //           shape: ShapeEncode(value: BasicLineShape()),
    //           color: ColorEncode(value: color),
    //         )
    //       ],
    //       axes: [
    //         // Defaults.horizontalAxis,
    //         AxisGuide(
    //           position: 0.075,
    //           label: LabelStyle(
    //             textStyle: textStyle,
    //             offset: const Offset(0, 7.5),
    //           ),
    //           // Defaults.vertocalAxis,
    //         ),
    //       ],
    //       annotations: crearAnotaciones(context),
    //     );
    //   } else {
    //     return const Center();
    //   }
    // }
  }
}
