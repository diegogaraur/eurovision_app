import 'package:allesc/providers/graficos_provider.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:provider/provider.dart';

class LineChart2 extends StatefulWidget {
  const LineChart2({super.key});

  @override
  State<LineChart2> createState() => _LineChart2State();
}

class _LineChart2State extends State<LineChart2> {
  late List datos =
      Provider.of<GraficosProvider>(context, listen: true).posiciones;

  List<TagAnnotation> crearAnotaciones(estiloTexto) {
    return datos.map((dynamic map) {
      return TagAnnotation(
        label: Label('${map['posicion']}', LabelStyle(textStyle: estiloTexto)),
        values: [map['anio'], map['valor']],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 10);
    TextStyle tagTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primaryContainer,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
    Color color = Theme.of(context).colorScheme.onPrimaryContainer;

    Chart grafico = Chart(
      data: datos,
      variables: {
        'anio': Variable(
          accessor: (dynamic map) => map['anio'] as String,
          scale: OrdinalScale(inflate: true),
        ),
        'valor': Variable(accessor: (dynamic map) => map['valor'] as num)
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
      annotations: crearAnotaciones(tagTextStyle),
    );

    return grafico;
  }
}
