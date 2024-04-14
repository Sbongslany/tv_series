import'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/character_model.dart';

@immutable
abstract class CharacterState extends Equatable{} //used to compare two variables or the variables that have the same value
//data loading state
class CharacterLoadingState extends CharacterState{ // this class is called and it returns null

  @override
  List<Object?> get props => [];
}

//data loaded state
class CharacterLoadedState extends CharacterState{ // this class is called and it returns null
  CharacterLoadedState(this.characters);
  final List<CharacterModel> characters;
  @override
  List<Object?> get props => [characters];

}
//data error loading state
class CharacterErrorState extends CharacterState{ // this class is called and it returns null
  CharacterErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];

}