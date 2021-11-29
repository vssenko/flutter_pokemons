import 'package:flutter/material.dart';
import '../../models/pokemon.dart';
import '../../services/pokemon.dart';
import '../../widgets/layout.dart';
import '../../widgets/loader.dart';
import '../../utils/dimensions.dart';
import './pokemon_card.dart';

class PokemonScreen extends StatefulWidget {
  final String pokemonId;
  const PokemonScreen({Key? key, required this.pokemonId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PokemonState();
  }
}

class _PokemonState extends State<PokemonScreen> {
  final PokemonService _pokemonService = const PokemonService();

  Pokemon? pokemon;

  @override
  void initState() {
    super.initState();
    _reloadPokemon();
  }

  Widget _buildLoader() {
    return const Center(child: Loader());
  }

  Widget _buildPokemonCard() {
    return PokemonCard(pokemon: pokemon!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (pokemon == null) {
      content = _buildLoader();
    } else {
      content = SizedBox(
          width: Dimensions.getPercentWidth(context, 90),
          child: _buildPokemonCard());
    }

    return MainLayout(
        title:
            pokemon == null ? 'Pokemon' : '#${pokemon!.id}: ${pokemon!.name!}',
        content: Container(
          color: Colors.blue[50],
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 50),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: content),
        ));
  }

  _reloadPokemon() async {
    var loadedPokemon = await _pokemonService.loadOne(widget.pokemonId);
    setState(() {
      pokemon = loadedPokemon;
    });
  }
}
