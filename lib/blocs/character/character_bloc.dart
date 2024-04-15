import '../../repository/repositories.dart';
import 'character_event.dart';
import 'character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _characterRepository;

  // Constructor initializing with CharacterLoadingState
  CharacterBloc(this._characterRepository) : super(CharacterLoadingState()) {
    // Listening for LoadCharacterEvent and reacting accordingly
    on<LoadCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState()); // Emitting loading state
      try {
        // Fetching characters from repository
        final characters = await _characterRepository.getCharacters();
        // Emitting loaded state with fetched characters
        emit(CharacterLoadedState(characters, hasReachedMax: false));
      } catch (e) {
        // Emitting error state if an exception occurs during data fetching
        emit(CharacterErrorState(error: e.toString()));
      }
    });
  }
}
