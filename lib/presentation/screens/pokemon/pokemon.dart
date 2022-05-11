import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/presentation/screens/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokemons/presentation/widgets/pokemon/pokemon_widget.dart';

class ScreenArguments {
  final Pokemon pokemon;
  final bool isFavorite;

  ScreenArguments({required this.pokemon, required this.isFavorite});
}

class PokemonScreen extends StatelessWidget {
  final ScreenArguments args;
  const PokemonScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PokemonCubit>(context)
        .getPokemonDetails(int.parse(args.pokemon.id));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if ((state is PokemonDetailsLoaded)) {
            final pokemon = (state).pokemon;
            return PokemonWidget(
              pokemon: args.pokemon,
              pokemonDetails: pokemon,
            );
          }
          return Container(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Center(child: CircularProgressIndicator()));
        },
      ),
      floatingActionButton: Container(
        width: 200.0,
        height: 50.0,
        child: Text(
          !args.isFavorite ? 'Mark as favourite' : 'Remove from favourites',
          style: TextStyle(
              color: !args.isFavorite ? Colors.white : Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: !args.isFavorite ? Colors.indigo : Colors.indigo[100]),
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
