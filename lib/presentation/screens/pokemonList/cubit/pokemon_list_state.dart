part of 'pokemon_list_cubit.dart';

@immutable
abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonsLoaded extends PokemonListState {
  final List<Pokemon> pokemons;

  PokemonsLoaded({required this.pokemons});
}

class PokemonsLoading extends PokemonListState {}

class PokemonsError extends PokemonListState {
  final String error;
  PokemonsError({required this.error});
}
