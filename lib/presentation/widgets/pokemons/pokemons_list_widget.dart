import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/presentation/widgets/Pokemons/pokemon_widget.dart';

class PokemonsListWidget extends StatelessWidget {
  final List<Pokemon>? pokemons;
  const PokemonsListWidget({Key? key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 3;
    if (this.pokemons != null) {
      return Container(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: (1.2 / 1.5),
          children: pokemons!
              .map<Widget>((pokemon) =>
                  PokemonWidget(isFavourite: false, pokemon: pokemon))
              .toList(),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.only(top: 0),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
