import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/person_model.dart';

import 'person_event.dart';
import 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(InitialPersonState()) {
    on<FetchPeopleEvent>(_fetchPeople);
    on<CreatePersonEvent>(_createNewPerson);
  }

  Future<void> _fetchPeople(event, emit) async {
    emit(LoadingPersonState());
    try {
      final people = await Future.delayed(
        // o future.delayed é só pra simular caso fosse uma chamada de api
        const Duration(seconds: 1),
        () {
          return _fetchPeopleFunction();
        },
      );
      emit(SucessPersonState(people));
    } catch (e) {
      emit(ExceptionPersonState(e.toString(),));
    }
  }

  Future<void> _createNewPerson(CreatePersonEvent event, emit) async {
    final model = event.model;
    emit(LoadingPersonState());
    await _createNewPersonFunction(model);
    add(FetchPeopleEvent()); //* depois de criar uma pessoa ele vai chamar o estado de  _fetchPeople ou seja mostrar as pessoas
  }
}




//------------------------ User Case ---------------------------------//

//* Criei um metodo pra simular uma api. Normalmente seria: final people = await.fetchpeople();

List<PersonModel> _fetchPeopleFunction() {
  List<PersonModel> people = [
    PersonModel(name: 'João', email: 'hoao@hotmaild.com', phone: '989883823'),
    PersonModel(
        name: 'Maria', email: 'maria@hotmail.com', phone: '99832322323'),
    PersonModel(name: 'José', email: 'Jose@hotmail.com', phone: '99832322323'),
  ];
  return people;
}

List<PersonModel> _createNewPersonFunction(PersonModel model) {
  List<PersonModel> people = [
    PersonModel(name: model.name, email: model.email, phone: model.phone),
  ];
  return people;
}
