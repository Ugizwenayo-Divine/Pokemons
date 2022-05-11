import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemonDetails.dart';
import 'package:pokemons/presentation/widgets/pokemon/pokemon_description_widget.dart';
import 'package:pokemons/utils/capitalize.dart';
import 'package:pokemons/utils/getBackColor.dart';

class PokemonDetailsWidget extends StatelessWidget {
  final PokemonDetails pokemonDetails;
  const PokemonDetailsWidget({Key? key, required this.pokemonDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        capitalize(pokemonDetails.name),
                        style: TextStyle(
                            fontSize: 42.0, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        capitalize(pokemonDetails.type),
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w400),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  padding: EdgeInsets.only(left: 24.0),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '# ${pokemonDetails.id}',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                        padding: EdgeInsets.only(bottom: 20.0, left: 20.0),
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Expanded(
                          child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(pokemonDetails.image)
                              ),
                        ),
                      ))
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  height: 150.0,
                )
              ],
            ),
            decoration: BoxDecoration(color: getBackColor(pokemonDetails.type)),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: Row(
              children: [
                PokemonDescriptionWidget(
                    title: "Height", value: pokemonDetails.height.toString()),
                PokemonDescriptionWidget(
                    title: "Weight", value: pokemonDetails.weight.toString()),
                PokemonDescriptionWidget(
                    title: "BMI",
                    value: (pokemonDetails.weight /
                            (pokemonDetails.weight * pokemonDetails.weight))
                        .toStringAsFixed(2)),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            height: 80.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}
