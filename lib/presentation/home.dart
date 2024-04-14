import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/blocs/character/character_bloc.dart';
import 'package:tv_series/blocs/character/character_event.dart';
import 'package:tv_series/blocs/character/character_state.dart';
import 'package:tv_series/models/character_model.dart';
import 'package:tv_series/repository/repositories.dart';

import 'details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( // Injecting the bloc
        create: (context) => CharacterBloc(
          RepositoryProvider.of<CharacterRepository>(context),
        )..add(LoadCharacterEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Characters App'),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
           if(state is CharacterLoadingState){
             return const Center(
               child: CircularProgressIndicator(),
             );
           }
           if(state is CharacterLoadedState){
             List<CharacterModel> characterList = state.characters;
             return  ListView.builder(
               itemCount: characterList.length,
               itemBuilder: (_,index){
                 return InkWell(
                   onTap: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => DetailsScreen(e : characterList[index]))
                     );
                   },
                   child: Card(
                     color: Colors.blue,
                     elevation: 4,
                     margin: EdgeInsets.symmetric(vertical: 10),
                     child: ListTile(
                       title: Text(characterList[index].name!),
                       trailing: Image.network(characterList[index].image!),
                     ),
                   ),
                 );
               },
             );
           }
           if(state is CharacterErrorState){
             return const Center(child: Text("error"),);
           }
           return Container();
          }
        ),
      ),
    );
  }
}
