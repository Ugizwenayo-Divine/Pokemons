// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/cubit/pokemon_list_cubit.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/presentation/screens/pokemon.dart';

// class PokemonWidget extends StatelessWidget {
//   late final bool isFavourite;
//   late final Pokemon pokemon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _pokemon(
//           context: context, isFavourite: isFavourite, pokemon: pokemon),
//     );
//   }

//   Widget _pokemon({context, isFavourite, pokemon}) {

// }

class PokemonWidget extends StatelessWidget {
  final bool isFavourite;
  final Pokemon pokemon;
  const PokemonWidget(
      {Key? key, required this.isFavourite, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, '/pokemon',
            arguments: ScreenArguments(
                pokemon: this.pokemon, isFavorite: this.isFavourite)),
        BlocProvider.of<PokemonListCubit>(context)
            .getPokemonDetails(pokemon.id),
      },
      child: Container(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                child: Image(
                  image: NetworkImage(pokemon.image),
                  height: 120.0,
                  width: 120.0,
                ),
                decoration: BoxDecoration(
                    color: isFavourite ? Colors.green[50] : Colors.blue[50]),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Text(
                      '# ${pokemon.id}',
                      style: TextStyle(fontFamily: "Noto Sans"),
                    ),
                    Text(pokemon.name,
                        style: TextStyle(
                            fontFamily: "Noto Sans",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(color: Colors.white),
        height: 180.0,
      ),
    );
  }
}
