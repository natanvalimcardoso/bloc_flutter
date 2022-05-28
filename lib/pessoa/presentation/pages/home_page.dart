import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_petize/pessoa/domain/model/person_model.dart';
import 'package:flutter_bloc_petize/pessoa/presentation/bloc/person_event.dart';

import '../bloc/person_bloc.dart';
import '../bloc/person_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = PersonBloc()..add(FetchPeopleEvent());
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Bloc",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<PersonBloc, PersonState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is LoadingPersonState) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.5,
                    ),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is InitialPersonState) {
                return Padding(
                  padding: EdgeInsets.only(top: size.height * 0.7),
                  child: Text('Nenhuma Pessoa'),
                );
              }

              if (state is ExceptionPersonState) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is SucessPersonState) {
                // _isLoading = true;
                final peopleList = state.models;
                return SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    itemCount: peopleList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(peopleList[index].name),
                        subtitle: Text(peopleList[index].email),
                        trailing: Text(peopleList[index].phone),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
          Visibility(
            // visible: _isLoading,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(CreatePersonEvent(PersonModel(name: )));
                },
                child: Text('Criar Pessoa'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
