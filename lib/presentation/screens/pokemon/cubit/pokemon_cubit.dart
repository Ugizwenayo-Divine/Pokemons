import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemons/data/models/pokemonDetails.dart';
import 'package:pokemons/data/repository.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final Repository repository;
  PokemonCubit({required this.repository}) : super(PokemonInitial());
  void getPokemonDetails(id) {
    repository
        .getPokemonDetails(id)
        .then((value) => {emit(PokemonDetailsLoaded(pokemon: value))});
  }
}
