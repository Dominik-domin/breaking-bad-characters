import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/repository/character_repository.dart';
import 'package:breaking_bad_characters/theme/background_gradient.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              context.router.push(CharactersListPageRoute());
              //CharactersRepository().getCharacters();
            },
            child: Text(
              "GO",
            ),
          ),
        ),
      ),
    );
  }
}
