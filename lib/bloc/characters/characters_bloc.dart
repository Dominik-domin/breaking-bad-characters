import 'package:bloc/bloc.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/repository/character_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoadingState()) {
    final CharactersRepository _charactersRepository = CharactersRepository();

    on<LoadCharactersEvent>((event, emit) async {
      emit(CharactersLoadingState());
      try {
        final characters = await _charactersRepository.getCharacters();

        emit(CharactersLoadedState(characters));
      } catch (e) {
        emit(CharactersErrorState(e.toString()));
      }
    });
  }
}
