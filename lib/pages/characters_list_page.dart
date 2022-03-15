import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/bloc/characters/characters_bloc.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/theme/background_gradient.dart';
import 'package:breaking_bad_characters/widgets/character_card/character_card.dart';
import 'package:breaking_bad_characters/widgets/no_internet_dialog.dart';
import 'package:breaking_bad_characters/widgets/get_characters_hint.dart';
import 'package:breaking_bad_characters/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  late CharactersBloc _charactersBloc;
  @override
  void initState() {
    super.initState();
    _charactersBloc = context.read<CharactersBloc>();
    _charactersBloc.add(LoadCharactersFromNetworkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _charactersBloc.add(LoadCharactersFromNetworkEvent());
        },
        child: const Icon(Icons.refresh),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Center(
          child: BlocListener<CharactersBloc, CharactersState>(
            listener: (context, state) {
              if (state is CharactersNetworkErrorState) {
                showNoInternetDialog(
                  context: context,
                  isLocalStorageEmpty: state.isLocalStorageEmpty,
                );
              }
            },
            child: BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoadingState) {
                  return buildLoader();
                }
                if (state is CharactersLoadedState) {
                  return _buildCharactersList(
                    context: context,
                    characters: state.characters,
                  );
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
    );
  }

  void showNoInternetDialog({
    required BuildContext context,
    required bool isLocalStorageEmpty,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => buildNoInternetDialog(
            context: context,
            isLocalStorageEmpty: isLocalStorageEmpty,
            onConfirmButtonPressed: () {
              context.router.pop();
              context.read<CharactersBloc>().add(
                    LoadCharactersFromLocalEvent(),
                  );
            }),
      );

  Widget _buildCharactersList({
    required BuildContext context,
    required List<Character> characters,
  }) =>
      SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return buildCharacterCard(
                    character: characters[index],
                    context: context,
                  );
                }),
            buildGetCharactersHint(context: context),
          ],
        ),
      );
}
