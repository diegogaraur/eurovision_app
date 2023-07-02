import 'package:allesc/datos_charts.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class BarChart2 extends StatelessWidget {
  const BarChart2({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.onPrimaryContainer;
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 10);
    TextStyle tagTextStyle = const TextStyle(color: Colors.white, fontSize: 12);
    return Chart(
      data: posiciones,
      variables: {
        'año': Variable(accessor: (Map map) => map['año'] as String),
        'puesto': Variable(accessor: (Map map) => map['puesto'] as num)
      },
      marks: [
        IntervalMark(
          color: ColorEncode(value: color),
          size: SizeEncode(value: 25),
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
        ),
        // AxisGuide(position: 0),
        // Defaults.verticalAxis,
        // AxisGuide(position: 10),
        // AxisGuide(
        //   position: 100,
        // ),
      ],
      annotations: [
        TagAnnotation(
          label: Label(
              '25',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2013', (26 - 25) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '10',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2014', (26 - 10) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '21',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2015', (26 - 21) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '22',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2016', (26 - 22) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '26',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2017', (26 - 26) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '23',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2018', (26 - 23) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '22',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2019', (26 - 22) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '24',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2021', (26 - 24) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '3',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2022', (26 - 3) / 26 * 100 + 1],
        ),
        TagAnnotation(
          label: Label(
              '17',
              LabelStyle(
                textStyle: tagTextStyle,
                offset: const Offset(0, -10),
              )),
          values: ['2023', (26 - 17) / 26 * 100 + 1],
        ),
      ],
    );
  }
}
