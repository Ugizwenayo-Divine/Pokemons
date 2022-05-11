import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/presentation/widgets/Pokemons/pokemon_widget.dart';

class FavouritePokemonsWidget extends StatelessWidget {
  final List<Pokemon> pokemons;
  const FavouritePokemonsWidget({Key? key, required this.pokemons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 3;
    if (this.pokemons != null) {
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (1 / 1.4),
        children: pokemons
            .map<Widget>(
                (pokemon) => PokemonWidget(isFavourite: true, pokemon: pokemon))
            .toList(),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
