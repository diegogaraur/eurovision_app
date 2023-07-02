import 'package:allesc/models/models.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class BanderaPais extends StatelessWidget {
  final Pais pais;
  const BanderaPais({super.key, required this.pais});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountryFlag.fromCountryCode(pais.codPais!, height: 20, width: 24),
        const SizedBox(width: 8),
        Text(pais.nombre!)
      ],
    );
  }
}
