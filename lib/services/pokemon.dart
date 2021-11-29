import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../models/pokemon.dart';

class FetchListResult<T> {
  List<T> items;
  int total;

  FetchListResult({required this.items, required this.total});
}

var _fetchPokemonListUrl = Uri.parse('${Config.pokemonApiUrl}/pokemon');
Uri _buildFetchOnePokemonUrl(String id) {
  return Uri.parse('${Config.pokemonApiUrl}/pokemon/$id');
}

class PokemonService {
  const PokemonService();

  Future<FetchListResult<Pokemon>> load(
      {String? name, int? skip, int? limit}) async {
    print('load pokemons: name: $name, skip: $skip, limit: $limit');
    var response = await http.get(_fetchPokemonListUrl);
    List<dynamic> pokemonJsons = json.decode(response.body);
    var result = pokemonJsons.map((pokemonJson) {
      return Pokemon.fromJson(pokemonJson);
    }).toList();
    if (name != null && name != '') {
      var searchName = name.toLowerCase();
      result = result
          .where((element) =>
              element.name != null &&
              element.name!.toLowerCase().contains(searchName))
          .toList();
    }
    var total = result.length;
    if ((skip ?? 0) > 0) {
      result = result.sublist(skip!).toList();
    }
    if ((limit ?? 0) > 0) {
      result = result.sublist(0, math.min(limit!, result.length));
    }

    return FetchListResult(items: result, total: total);
  }

  Future<Pokemon> loadOne(String id) async {
    var response = await http.get(_buildFetchOnePokemonUrl(id));
    dynamic pokemonJson = json.decode(response.body);
    return Pokemon.fromJson(pokemonJson);
  }
}
