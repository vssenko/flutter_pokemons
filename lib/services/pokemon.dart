import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../models/pokemon.dart';

var fetchPokemonUrl = Uri.parse('${Config.pokemonApiUrl}/pokemon');

class PokemonService {
  Future<List<Pokemon>> load() async {
    var response = await http.get(fetchPokemonUrl);
    List<dynamic> pokemonJsons = json.decode(response.body);
    List<Pokemon> result = pokemonJsons
        .map((pokemonJson) {
          return Pokemon.fromJson(pokemonJson);
        })
        .toList()
        .sublist(0, 10);
    return result;
  }
}
