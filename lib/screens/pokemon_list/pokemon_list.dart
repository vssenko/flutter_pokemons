import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:flutter/material.dart';
import './pokemon_row.dart';
import '../../widgets/loader.dart';
import '../../widgets/layout.dart';
import '../../services/pokemon.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PokemonListState();
  }
}

class _PokemonListState extends State<PokemonListScreen> {
  late final PokemonService _pokemonService;

  List<Pokemon>? _pokemons;

  _PokemonListState() {
    _pokemonService = PokemonService();
  }

  @override
  void initState() {
    super.initState();
    _reloadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_pokemons == null) {
      content = const Center(child: Loader());
    } else {
      List<Widget> pokemonRows = _pokemons!.map((pokemon) {
        return PokemonRow(
          pokemon: pokemon,
        );
      }).toList();

      content = Container(
          padding: const EdgeInsets.only(top: 10),
          child: Expanded(
              child: ListView(
            shrinkWrap: true,
            children: pokemonRows,
          )));
    }
    return MainLayout(
        title: 'Pokemon List',
        content: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: content));
  }

  _reloadPokemons() async {
    var loadedPokemons = await _pokemonService.load();
    setState(() {
      _pokemons = loadedPokemons;
    });
  }
}
