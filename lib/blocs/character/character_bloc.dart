import '../../repository/repositories.dart';
import 'character_event.dart';
import 'character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _characterRepository;

  CharacterBloc(this._characterRepository) : super(CharacterLoadingState()){
    on<LoadCharacterEvent>((event, emit) async{
      emit(CharacterLoadingState()); //trigger state
    });
  }
}