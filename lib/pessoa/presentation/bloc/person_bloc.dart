import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_petize/pessoa/presentation/bloc/person_event.dart';
import 'package:flutter_bloc_petize/pessoa/presentation/bloc/person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(InitialPersonState()) {
    on<ShowPeople>(_showPeople);
    on<CreatePerson>(_createPerson);
  }


  Future<void> _showPeople(event, emit)async {}
  Future<void> _createPerson(event, emit)async {
    final model = event.model;
  }

}
