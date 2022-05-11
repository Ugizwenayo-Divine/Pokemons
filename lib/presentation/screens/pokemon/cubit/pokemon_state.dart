part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonDetailsLoaded extends PokemonState {
  final PokemonDetails pokemon;

  PokemonDetailsLoaded({required this.pokemon});
}
