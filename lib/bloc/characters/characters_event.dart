part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  const CharactersEvent();
}

class LoadCharactersFromNetworkEvent extends CharactersEvent {
  @override
  List<Object> get props => [];
}

class LoadCharactersFromLocalEvent extends CharactersEvent {
  @override
  List<Object> get props => [];
}
