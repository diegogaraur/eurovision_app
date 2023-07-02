import 'package:allesc/models/models.dart';
import 'package:allesc/providers/votaciones_provider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<CancionPais> list = <CancionPais>[
  CancionPais(null, null),
  CancionPais('EaEa', 'ES'),
  CancionPais('Cha Cha Cha', 'Fi'),
  CancionPais('Tattoo', 'SE'),
  CancionPais('Queen Of Kings', 'NO'),
];

int indice = 0;

class ESCDropDownButton extends StatefulWidget {
  final int indice;
  const ESCDropDownButton({super.key, required this.indice});

  @override
  State<ESCDropDownButton> createState() => _ESCDropDownButtonState();
}

class _ESCDropDownButtonState extends State<ESCDropDownButton> {
  // CancionPais dropdownValue = list.first;
  dynamic dropdownValue;
  _ESCDropDownButtonState();

  @override
  Widget build(BuildContext context) {
    final votacionesProvider = Provider.of<VotacionesProvider>(context);
    dropdownValue = votacionesProvider.votaciones[widget.indice].cancionPais;
    list = votacionesProvider.listasVotables[widget.indice];

    return DropdownButton<CancionPais>(
      hint: const Text('Elige una canción'),
      value: dropdownValue,
      elevation: 16,
      underline: Container(
        height: 1,
        color: Theme.of(context).colorScheme.primary,
      ),
      onChanged: (CancionPais? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map((CancionPais cancionPais) {
        return DropdownMenuItem<CancionPais>(
          value: cancionPais,
          child: Row(
            children: <Widget>[
              if (cancionPais.codPais != null)
                CountryFlag.fromCountryCode(cancionPais.codPais!, width: 24),
              const SizedBox(width: 8),
              Text(cancionPais.cancion ?? 'Elige una canción'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
