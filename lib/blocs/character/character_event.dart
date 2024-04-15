import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable // Annotation indicating that instances won't change after creation
abstract class CharacterEvent extends Equatable{
  const CharacterEvent();// Constructor for CharacterEvent
}
// Event to load initial characters
class LoadCharacterEvent extends CharacterEvent{
  @override
  List<Object?> get props => [];// Equatable properties for comparison
}
// Event to load the next page of characters
class LoadNextPageEvent extends CharacterEvent {
  const LoadNextPageEvent();// Constructor for LoadNextPageEvent

  @override
  List<Object?> get props => [];// No properties to compare
}