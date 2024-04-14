import 'package:equatable/equatable.dart';
import 'package:tv_series/models/character_model.dart';

class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object?> get props => [];
}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<CharacterModel> characters;
  final bool hasReachedMax; // Define the parameter here

  const CharacterLoadedState(this.characters, {required this.hasReachedMax}); // Update the constructor accordingly

  @override
  List<Object?> get props => [characters, hasReachedMax];
}

class CharacterErrorState extends CharacterState {
  final String error;

  const CharacterErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
