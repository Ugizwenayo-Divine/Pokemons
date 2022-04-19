class Pokemon {
  late String id;
  late String name;
  late String image;
  late String url;
  late dynamic types;

  Pokemon.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    url = json["url"];
    types = json["types"];
  }
}
