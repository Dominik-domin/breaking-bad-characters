import 'package:breaking_bad_characters/bloc/characters/characters_bloc.dart';
import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/pages/character_details_page.dart';
import 'package:breaking_bad_characters/repository/character_repository.dart';
import 'package:breaking_bad_characters/theme/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  // late CharactersBloc _charactersBloc;
  late SharedPreferences _sharedPreferences;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.telegram),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: backgroundGradient2,
        ),
        child: BlocProvider(
          create: (_) => CharactersBloc()..add(LoadCharactersEvent()),
          child: Center(
            child: BlocListener<CharactersBloc, CharactersState>(
              listener: (context, state) {
                if (state is CharactersErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("EROR"),
                    ),
                  );
                }
              },
              child: BlocBuilder<CharactersBloc, CharactersState>(
                builder: (context, state) {
                  if (state is CharactersLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CharactersLoadedState) {
                    return ListView.builder(
                        itemCount: state.characters.length,
                        itemBuilder: (context, index) {
                          return _buildCard(state.characters[index]);
                        });
                  }
                  if (state is CharactersErrorState) {
                    return Center(
                      child: Text("ERROR: ${state.error.toString()}"),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Character character) {
    return InkWell(
      onTap: () {
        /* context.router.push(
          CharacterDetailsPageRoute(character: character),
        );*/
        final test = _sharedPreferences.getString('characters');
        print(test);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        height: 80,
        color: Colors.blue,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(character.img ?? ''),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Text(character.name ?? ''),
                Text(character.status ?? ''),
              ],
            )
          ],
        ),
      ),
    );
  }
}
