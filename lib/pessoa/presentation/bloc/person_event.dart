import 'package:flutter_bloc_petize/pessoa/domain/model/person_model.dart';

abstract class PersonEvent{}

class ShowPeople extends PersonEvent{
}

class CreatePerson extends PersonEvent{
  final PersonModel;

  CreatePerson(this.PersonModel);
}