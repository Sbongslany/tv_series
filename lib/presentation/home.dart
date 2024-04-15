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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if the user has scrolled near the bottom
    if (_scrollController.position.extentAfter < 500) {
      // Trigger event to load next page of characters
      context.read<CharacterBloc>().add(LoadNextPageEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Providing the CharacterBloc to the widget tree
      create: (context) => CharacterBloc(
        RepositoryProvider.of<CharacterRepository>(context),
      )..add(LoadCharacterEvent()),// Triggering event to load initial characters
      child: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: const Text('TV Characters App'),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            // Show loading indicator while characters are loading
            if (state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // Render the loaded characters
            if (state is CharacterLoadedState) {
              List<CharacterModel> characterList = state.characters;
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: ListView.builder(
                  itemCount: characterList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      // Navigate to details screen when a character is tapped
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(e: characterList[index])),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(characterList[index].name!),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            leading: Image.network(characterList[index].image!),
                          ),
                        ),
                      ),
                    );
                  },
                  controller: _scrollController,
                ),
              );
            }
            if (state is CharacterErrorState) {
              return const Center(
                child: Text("error"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

