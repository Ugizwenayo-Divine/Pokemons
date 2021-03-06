import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/data/models/pokemonDetails.dart';
import 'package:pokemons/data/networkService.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});
  final String imageURL =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/";

  String extractId(json) {
    return json["url"]
        .toString()
        .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
        .replaceAll('/', '');
  }

  String formatId(String id) {
    if (id.length == 1) {
      return '00${id}';
    }
    if (id.length == 2) {
      return '0${id}';
    }
    return id;
  }

  Future<List<Pokemon>?> getPokemons() async {
    final pokemonsRaw = await networkService.getPokemons();
    if (pokemonsRaw != null) {
      final pokemonsList = pokemonsRaw
          .map((e) => Pokemon.fromJson({
                "id": formatId(extractId(e)),
                ...e,
                "image": "${imageURL}${extractId(e)}.png",
                "types": null
              }))
          .toList();

      return pokemonsList;
    }
    return null;
  }

  Future<dynamic?> getPokemonDetails(id) async {
    final pokemonsRaw = await networkService.getPokemonDetails(id);

    if (pokemonsRaw != null) {
      final pokemonsList = PokemonDetails.fromJson({
        "id": formatId(pokemonsRaw["id"].toString()),
        "name": pokemonsRaw["name"],
        "image": "${imageURL}${pokemonsRaw["id"]}.png",
        "weight": pokemonsRaw["weight"],
        "height": pokemonsRaw["height"],
        "type": pokemonsRaw["types"]
            .map((e) => e["type"]["name"])
            .toList()
            .join(','),
        "stats": pokemonsRaw["stats"],
      });
      return pokemonsList;
    }
    return null;
  }
}
