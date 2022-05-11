import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemons/data/models/pokemon.dart';
import 'package:pokemons/data/repository.dart';
part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  final Repository repository;
  PokemonListCubit({required this.repository}) : super(PokemonListInitial());
  void getPokemons() {
    repository.getPokemons().then((value) =>
        {emit(PokemonsLoaded(pokemons: value != null ? value : []))});
  }
}
