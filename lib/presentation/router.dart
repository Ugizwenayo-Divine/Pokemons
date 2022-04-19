import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/cubit/pokemon_list_cubit.dart';
import 'package:pokemons/data/networkService.dart';
import 'package:pokemons/data/repository.dart';
import 'package:pokemons/presentation/screens/pokemon.dart';
import 'package:pokemons/presentation/screens/pokemons_list.dart';

class AppRouter {
  late final Repository repository;
  late final PokemonListCubit pokemonListCubit;
  // final NetworkService networkService;
  AppRouter() {
    repository = Repository(networkService: NetworkService());
    pokemonListCubit = PokemonListCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => PokemonListCubit(repository: repository),
                  child: PokemonsList(),
                ));
      case '/pokemon':
        final args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => PokemonScreen(
                  args: args as ScreenArguments,
                ));
      default:
        return null;
    }
  }
}
