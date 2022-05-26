import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: BlocBuilder<PersonBloc, PersonState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingPersonState) {
            return const CircularProgressIndicator();
          }

          if (state is InitialPersonState) {
            return const Center(
              child: Text('Nenhuma Pessoa'),
            );
          }

          if (state is ExceptionPersonState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SucessPersonState) {
            final peopleList = state.models;
            return ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(peopleList[index].name),
                  subtitle: Text(peopleList[index].email),
                  trailing: Text(peopleList[index].phone),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
