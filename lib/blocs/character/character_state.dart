import 'package:equatable/equatable.dart';
import 'package:tv_series/models/character_model.dart';

// State representing the character-related states
class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object?> get props => [];
}

// State indicating that characters are being loaded
class CharacterLoadingState extends CharacterState {}

// State indicating that characters are successfully loaded
class CharacterLoadedState extends CharacterState {
  final List<CharacterModel> characters;// List of loaded characters
  final bool hasReachedMax; // Indicates if the end of characters list is reached

  const CharacterLoadedState(this.characters, {required this.hasReachedMax}); // Update the constructor accordingly

  @override
  List<Object?> get props => [characters, hasReachedMax];
}

// State indicating that an error occurred while loading characters
class CharacterErrorState extends CharacterState {
  final String error;

  const CharacterErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
