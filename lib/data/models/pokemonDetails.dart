import 'package:pokemons/data/models/pokemonStats.dart';

class PokemonDetails {
  late String id;
  late String name;
  late String image;
  late int height;
  late int weight;
  late String type;
  late List<dynamic> stats;

  PokemonDetails.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    height = json["height"];
    weight = json["weight"];
    type = json["type"];
    stats = json["stats"]
        .map((e) => PokemonStats.fromJson({
              "name": e["stat"]["name"],
              "baseStat": e["base_stat"],
              "effort": e["effort"]
            }))
        .toList();
    ;
  }
}
