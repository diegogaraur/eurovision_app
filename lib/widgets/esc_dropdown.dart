import 'package:allesc/echarts_data.dart';
import 'package:allesc/models/models.dart';
import 'package:allesc/providers/votaciones_provider.dart';
import 'package:allesc/services/scoreboard_service.dart';
import 'package:allesc/services/usuario_service.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ESCDropDownButton extends StatefulWidget {
  final int indice;
  const ESCDropDownButton({super.key, required this.indice});

  @override
  State<ESCDropDownButton> createState() => _ESCDropDownButtonState();
}

class _ESCDropDownButtonState extends State<ESCDropDownButton> {
  dynamic dropdownValue;
  List<CancionPais> votables = [];
  _ESCDropDownButtonState();

  @override
  void initState() {
    final votacionesProvider =
        Provider.of<VotacionesProvider>(context, listen: false);
    final votacion = votacionesProvider.votados[widget.indice];
    print(votacion);
    if (votacion != {}) {
      print(votacion);
      dropdownValue = CancionPais(votacion['cancion'], votacion['pais']);
      if (dropdownValue != CancionPais(null, null)) {
        votacionesProvider.inicializarCanciones(
            widget.indice, CancionPais(votacion['cancion'], votacion['pais']));
      }
    }
    // votables = votacionesProvider.votables[widget.indice];
    // votables = List.of(votacionesProvider.votables[widget.indice]);
    // votables = Provider.of<VotacionesProvider>(context).votables;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VotacionesProvider>(builder: (context, provider, _) {
      return Form(
        key: provider.keys[widget.indice],
        child: DropdownButton<CancionPais>(
          hint: const Text('Elige una canción'),
          value: dropdownValue,
          elevation: 16,
          underline: Container(
            height: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          onChanged: (CancionPais? value) {
            // print('Dropdown onChange');
            // print('seleccionaCancion');
            setState(() {
              dropdownValue = value!;
              // var votacionesProvider =
              //     Provider.of<VotacionesProvider>(context, listen: false);
              // votacionesProvider.seleccionaCancion(widget.indice, value);

              // votables = Provider.of<VotacionesProvider>(context, listen: false)
              //     .votables[widget.indice];
              // votables = votacionesProvider.votables;
              // votables.remove(value);
              provider.seleccionaCancion(widget.indice, value);
            });
          },
          items:
              provider.votables[widget.indice].map((CancionPais cancionPais) {
            return DropdownMenuItem<CancionPais>(
              value: cancionPais,
              child: Row(
                children: <Widget>[
                  if (paisCodigo[cancionPais.pais] != null)
                    CountryFlag.fromCountryCode(paisCodigo[cancionPais.pais]!,
                        width: 24),
                  const SizedBox(width: 8),
                  Text(cancionPais.cancion ?? 'Elige una canción'),
                ],
              ),
            );
          }).toList(),
        ),
      );
    });

    // return DropdownButton<CancionPais>(
    //   hint: const Text('Elige una canción'),
    //   value: dropdownValue,
    //   elevation: 16,
    //   underline: Container(
    //     height: 1,
    //     color: Theme.of(context).colorScheme.primary,
    //   ),
    //   onChanged: (CancionPais? value) {
    //     setState(() {
    //       dropdownValue = value!;
    //     });
    //   },
    //   items: list.map((CancionPais cancionPais) {
    //     return DropdownMenuItem<CancionPais>(
    //       value: cancionPais,
    //       child: Row(
    //         children: <Widget>[
    //           if (cancionPais.codPais != null)
    //             CountryFlag.fromCountryCode(cancionPais.codPais!, width: 24),
    //           const SizedBox(width: 8),
    //           Text(cancionPais.cancion ?? 'Elige una canción'),
    //         ],
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}
