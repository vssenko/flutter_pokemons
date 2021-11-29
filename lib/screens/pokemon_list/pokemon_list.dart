import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:flutter/material.dart';
import './pokemon_row.dart';
import '../../widgets/loader.dart';
import '../../widgets/layout.dart';
import '../../widgets/paginator.dart';
import '../../services/pokemon.dart';

const limit = 10;

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PokemonListState();
  }
}

class _PokemonListState extends State<PokemonListScreen> {
  int? totalCount;
  int currentPage = 0;
  late final PokemonService _pokemonService;

  List<Pokemon>? _pokemons;

  _PokemonListState() {
    _pokemonService = const PokemonService();
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

      content = Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Paginator(
                totalPages: ((totalCount ?? 100) / limit).round(),
                currentPage: currentPage,
                onChange: _updatePage,
              )
            ],
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: pokemonRows,
          ))
        ],
      );
    }
    return MainLayout(
        title: 'Pokemon List',
        content: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: content));
  }

  _updatePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
    _reloadPokemons();
  }

  _reloadPokemons() async {
    print('_reloadPokemons');
    setState(() {
      _pokemons = null;
    });
    try {
      var loadPokemonsResult =
          await _pokemonService.load(limit: limit, skip: currentPage * limit);
      setState(() {
        print('setting state');
        print(loadPokemonsResult.total);
        print(loadPokemonsResult.items);
        totalCount = loadPokemonsResult.total;
        _pokemons = loadPokemonsResult.items;
      });
    } catch (e) {
      print(e);
      setState(() {
        _pokemons = [];
      });
      return;
    }
  }
}
