class PokemonStats {
  late String name;
  late String baseStat;
  late String effort;

  PokemonStats.fromJson(Map json) {
    name = json["name"];
    baseStat = json["baseStat"].toString();
    effort = json["effort"].toString();
  }
}
