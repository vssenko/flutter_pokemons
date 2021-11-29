import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../models/pokemon.dart';

var _fetchPokemonListUrl = Uri.parse('${Config.pokemonApiUrl}/pokemon');
Uri _buildFetchOnePokemonUrl(String id) {
  return Uri.parse('${Config.pokemonApiUrl}/pokemon/$id');
}

class PokemonService {
  const PokemonService();

  Future<List<Pokemon>> load() async {
    var response = await http.get(_fetchPokemonListUrl);
    List<dynamic> pokemonJsons = json.decode(response.body);
    List<Pokemon> result = pokemonJsons
        .map((pokemonJson) {
          return Pokemon.fromJson(pokemonJson);
        })
        .toList()
        .sublist(0, 10);
    return result;
  }

  Future<Pokemon> loadOne(String id) async {
    var response = await http.get(_buildFetchOnePokemonUrl(id));
    dynamic pokemonJson = json.decode(response.body);
    return Pokemon.fromJson(pokemonJson);
  }
}
