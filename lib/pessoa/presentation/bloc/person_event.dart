import '../../domain/model/person_model.dart';

abstract class PersonEvent{}

class CreatePersonEvent extends PersonEvent{
  final PersonModel model;

  CreatePersonEvent(this.model);
}

class FetchPeopleEvent extends PersonEvent{
}