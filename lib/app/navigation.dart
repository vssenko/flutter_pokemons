import 'package:flutter/material.dart';
import 'package:flutter_pokemons/screens/pokemon/pokemon.dart';
import 'package:flutter_pokemons/screens/pokemon_list/pokemon_list.dart';

import '../screens/not_found.dart';
import '../utils/routes.dart';

typedef BuilderCallBack = Widget Function(BuildContext);

Route<dynamic> unknownRouteHandler(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => const NotFoundScreen());
}

Route<dynamic> genericRouteHandler(RouteSettings settings) {
  final path = settings.name!;
  BuilderCallBack routeBuilder =
      (BuildContext context) => const NotFoundScreen();
  if (path == Routes.home) {
    routeBuilder = (BuildContext context) => const PokemonListScreen();
  } else if (path.startsWith('/pokemon/')) {
    final pokemonId = path.replaceAll('/pokemon/', '').replaceAll('/', '');
    routeBuilder = (BuildContext context) => PokemonScreen(
          pokemonId: pokemonId,
        );
  }

  return MaterialPageRoute(
    settings: settings,
    builder: routeBuilder,
  );
}
