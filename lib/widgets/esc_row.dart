import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ESCRow extends StatelessWidget {
  final int indice;

  const ESCRow({
    super.key,
    required this.indice,
  });

  @override
  Widget build(BuildContext context) {
    final votacionesProvider = Provider.of<VotacionesProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 32,
          width: 32,
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Text(
              '${votacionesProvider.votaciones[indice].puntos}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
          width: 16,
        ),
        ESCDropDownButton(indice: indice),
      ],
    );
  }
}
