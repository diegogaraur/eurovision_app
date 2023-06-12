import 'package:allesc/charts/bar_char_example.dart';
import 'package:flutter/material.dart';

class DatosView extends StatelessWidget {
  const DatosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Eurovision 2023',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          BarChartExample(),
        ],
      ),
    );
  }
}
