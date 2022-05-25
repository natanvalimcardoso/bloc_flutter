import 'package:flutter_bloc_petize/pessoa/domain/model/person_model.dart';

abstract class PersonState {}

class InitialPersonState extends PersonState {}

class LoadingPersonState extends PersonState {}

class SucessPersonState extends PersonState {
  final List<PersonModel> models;

  SucessPersonState(this.models);
}

class ExceptionPersonState extends PersonState {
  final String message;

  ExceptionPersonState(this.message);
}
