import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int id) _fecthPokemonName;

  PokemonBloc({required Future<String> Function(int id) fecthPokemon})
      : _fecthPokemonName = fecthPokemon,
        super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.id] = event.name;
      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }
    try {
      //final pokemonName = await PokemonInformation.getPokemonName(id);
      final pokemonName = await _fecthPokemonName(id);

      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to load pokemon');
    }
  }
}
