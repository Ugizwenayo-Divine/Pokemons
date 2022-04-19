import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/data/networkService.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});
  final String imageURL =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/";

  String extractId(json) {
    return json["url"]
        .toString()
        .replaceAll('https://pokeapi.co/api/v2/pokemon-form/', '')
        .replaceAll('/', '');
  }

  Future<List<Pokemon>?> getPokemons() async {
    final pokemonsRaw = await networkService.getPokemons();
    var res;
    if (pokemonsRaw != null) {
      final List<dynamic> results;
      var id;
      final pokemonsList = pokemonsRaw
          .map((e) => Pokemon.fromJson({
                "id": extractId(e),
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
      print('${pokemonsRaw} raw');
      // final pokemonsList = pokemonsRaw
      //     .map((e) => Pokemon.fromJson({
      //           "id": e["url"]
      //               .toString()
      //               .replaceAll('https://pokeapi.co/api/v2/pokemon-form/', '')
      //               .replaceAll('/', ''),
      //           ...e,
      //           "types": null
      //         }))
      //     .toList();
      // return pokemonsList;
    }
    return null;
  }
}
