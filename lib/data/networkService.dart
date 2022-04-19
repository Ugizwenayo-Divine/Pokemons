import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  final String baseURL = "https://pokeapi.co/api/v2/pokemon-form/";

  Future<List<dynamic>?> getPokemons() async {
    try {
      final response = await get(Uri.parse(baseURL));
      return jsonDecode(response.body)["results"];
    } catch (e) {
      return null;
    }
  }

  Future<dynamic?> getPokemonDetails(id) async {
    try {
      final response = await get(Uri.parse(baseURL + '$id'));
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}
