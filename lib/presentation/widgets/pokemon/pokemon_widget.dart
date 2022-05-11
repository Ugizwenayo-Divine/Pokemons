import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/data/models/pokemonDetails.dart';
import 'package:pokemons/presentation/widgets/pokemon/pokemon_details_widget.dart';
import 'package:pokemons/presentation/widgets/pokemon/pokemon_stats_widget.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  final PokemonDetails pokemonDetails;
  const PokemonWidget(
      {Key? key, required this.pokemon, required this.pokemonDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PokemonDetailsWidget(
            pokemonDetails: pokemonDetails,
          ),
          Expanded(
            child: PokemonStatsWidget(stats: pokemonDetails.stats),
          )
        ],
      ),
    );
  }
}
