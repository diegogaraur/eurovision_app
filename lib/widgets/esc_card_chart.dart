import 'package:allesc/models/models.dart';
import 'package:flutter/material.dart';

class ESCCardChart extends StatelessWidget {
  final Pais? pais;
  final String titulo;
  final Widget contenido;

  const ESCCardChart({
    super.key,
    this.pais,
    required this.titulo,
    required this.contenido,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).colorScheme.primaryContainer,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: const BeveledRectangleBorder(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Column(
            children: [
              // BanderaPais(pais: pais!),
              // const SizedBox(height: 8),
              Text(titulo),
            ],
          ),
          // const SizedBox(height: 8),
          // const Divider(),
          // const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.all(16),
            height: 260,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 0.5),
            ),
            child: contenido,
          )
        ],
      ),
    );
  }
}
