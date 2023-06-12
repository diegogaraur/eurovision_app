import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartExample extends StatelessWidget {
  final List<double> data = [10, 20, 30, 40, 50, 60, 70];
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
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          barTouchData: BarTouchData(
            enabled: false,
          ),
          gridData: FlGridData(
            show: false,
            // checkToShowHorizontalLine: (value) => value % 10 == 0,
            // getDrawingHorizontalLine: (value) => FlLine(
            //   color: Colors.grey,
            //   strokeWidth: 0.5,
            // ),
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
                        toY: value,
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 16,
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
