import'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CharacterState extends Equatable{} //used to compare two variables or the variables that have the same value

//data loading state
class CharacterLoadingState extends CharacterState{ // this class is called and it returns null
  @override
  List<Object?> get props => [];

}

//data loaded state



//data error loading state