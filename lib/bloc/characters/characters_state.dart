part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {}

class CharactersLoadingState extends CharactersState {
  @override
  List<Object?> get props => [];
}

class CharactersLoadedState extends CharactersState {
  final List<Character> characters;

  CharactersLoadedState(this.characters);
  @override
  List<Object> get props => [characters];
}

class CharactersErrorState extends CharactersState {
  final String error;

  CharactersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class CharactersNetworkErrorState extends CharactersState {
  final bool isLocalStorageEmpty;

  CharactersNetworkErrorState(this.isLocalStorageEmpty);
  @override
  List<Object?> get props => [isLocalStorageEmpty];
}
