import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/presentation/widgets/pokemon_widget.dart';

class PokemonsListWidget extends StatelessWidget {
  final List<Pokemon> pokemons;
  const PokemonsListWidget({Key? key, required this.pokemons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 3;
    if (this.pokemons != null) {
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
        children: pokemons
            .map<Widget>((pokemon) =>
                PokemonWidget(isFavourite: false, pokemon: pokemon))
            .toList(),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
