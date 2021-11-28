import 'package:flutter/material.dart';
import '../screens/pokemon_list/pokemon_list.dart';
import './navigation.dart' as navigation;
import './theme.dart' as theme;

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.buildAppTheme(context),
      home: const PokemonListScreen(),
      onUnknownRoute: navigation.unknownRouteHandler,
      onGenerateRoute: navigation.genericRouteHandler,
    );
  }
}
