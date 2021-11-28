import 'package:flutter/material.dart';
import '../../widgets/layout.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonId;
  const PokemonScreen({Key? key, required this.pokemonId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Pokemon',
        content: Container(
          color: Colors.blue[50],
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 50),
          child: Text('Pokemon', style: Theme.of(context).textTheme.headline6),
        ));
  }
}
