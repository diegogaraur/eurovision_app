import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartExample extends StatelessWidget {
  final List<double> data = [
    (26 - 25) / 26 * 100 + 5,
    (26 - 10) / 26 * 100 + 5,
    (26 - 21) / 26 * 100 + 5,
    (26 - 22) / 26 * 100 + 5,
    (26 - 26) / 26 * 100 + 5,
    (26 - 23) / 26 * 100 + 5,
    (26 - 22) / 26 * 100 + 5,
    (26 - 24) / 26 * 100 + 5,
    (26 - 3) / 26 * 100 + 5,
    (26 - 17) / 26 * 100 + 5,
  ];
  final List<double> posiciones = [
    25,
    10,
    21,
    22,
    26,
    23,
    22,
    24,
    3,
    17,
  ];
  final List<int> anios = [
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2021,
    2022,
    2023,
  ];
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
  ];

  BarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          maxY: 110,
          borderData: FlBorderData(show: false),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          baselineY: 0,
          barGroups: data
              .asMap()
              .map(
                (index, value) => MapEntry(
                  index,
                  BarChartGroupData(
                    x: anios[index] - 2000,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 30,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
