import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class BarChartTJ extends StatelessWidget {
  final List<int> data = [
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

  BarChartTJ({super.key});

  @override
  Widget build(BuildContext context) {
    int maximo = data.reduce(max);

    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          maxY: maximo + 1,
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
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value * 1.0,
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

// class BarChartTJ extends StatelessWidget {
//   const BarChartTJ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         barGroups: [
//           BarChartGroupData(
//             x: 1,
//             barRods: [
//               BarChartRodData(toY: 8, color: Colors.blue),
//             ],
//           ),
//           BarChartGroupData(
//             x: 2,
//             barRods: [
//               BarChartRodData(toY: 4, color: Colors.green),
//             ],
//           ),
//           BarChartGroupData(
//             x: 3,
//             barRods: [
//               BarChartRodData(toY: 6, color: Colors.red),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
