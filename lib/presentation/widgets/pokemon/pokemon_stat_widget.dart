import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemonStats.dart';
import 'package:pokemons/utils/capitalize.dart';
import 'package:pokemons/utils/getProgressColor.dart';

class PokemonStatWidget extends StatelessWidget {
  final PokemonStats stat;
  const PokemonStatWidget({Key? key, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    capitalize(stat.name),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                ),
                Text(
                  stat.baseStat,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          LinearProgressIndicator(
            value: (int.parse(stat.baseStat) / 150),
            color: getProgressColor(stat.baseStat),
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
