import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable // this means properties will not change
abstract class CharacterEvent extends Equatable{
  const CharacterEvent();
}

class LoadCharacterEvent extends CharacterEvent{
  @override
  List<Object?> get props => [];
}

class LoadNextPageEvent extends CharacterEvent {
  const LoadNextPageEvent();

  @override
  List<Object?> get props => [];
}