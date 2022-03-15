import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/repository/character_repository.dart';
import 'package:breaking_bad_characters/services/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoadingState()) {
    final CharactersRepository _charactersRepository = CharactersRepository();
    final ConnectivityService _connectivityService = ConnectivityService();

    on<LoadCharactersFromNetworkEvent>((event, emit) async {
      emit(CharactersLoadingState());
      final isConnectivitySuccesss =
          await _connectivityService.isConnectivitySuccess();
      if (!isConnectivitySuccesss) {
        bool isLocalStorageEmpty = true;
        SharedPreferences _sharedPreferences =
            await SharedPreferences.getInstance();
        String? charactersResponse = _sharedPreferences.getString('characters');
        if (charactersResponse == null || charactersResponse.isEmpty) {
          isLocalStorageEmpty = true;
        } else {
          isLocalStorageEmpty = false;
        }
        emit(CharactersNetworkErrorState(isLocalStorageEmpty));
      } else {
        try {
          final characters = await _charactersRepository.getCharacters();

          emit(CharactersLoadedState(characters));
        } catch (e) {
          emit(CharactersErrorState(e.toString()));
        }
      }
    });

    on<LoadCharactersFromLocalEvent>((event, emit) async {
      emit(CharactersLoadingState());
      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();

      String? charactersResponse = _sharedPreferences.getString('characters');

      var characters = (json.decode(charactersResponse!) as List)
          .map((i) => Character.fromJson(i))
          .toList();

      emit(CharactersLoadedState(characters));
    });
  }
}
