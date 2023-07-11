import 'package:allesc/echarts_data.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ESCRow extends StatefulWidget {
  final int indice;

  const ESCRow({
    super.key,
    required this.indice,
  });

  @override
  State<ESCRow> createState() => _ESCRowState();
}

class _ESCRowState extends State<ESCRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 32,
          width: 32,
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Text(
              '${indicePuntos[widget.indice]}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32, width: 16),
        ESCDropDownButton(indice: widget.indice),
      ],
    );
  }
}
