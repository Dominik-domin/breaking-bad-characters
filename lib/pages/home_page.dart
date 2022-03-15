import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:breaking_bad_characters/helpers/strings.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWelcomeTitle(context),
              const SizedBox(height: 70),
              _buildStartButton(context),
            ],
          )),
    );
  }

  Widget _buildWelcomeTitle(BuildContext context) => const Text(
        Strings.welcomeTitle,
        style: TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );

  Widget _buildStartButton(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.router.push(const CharactersListPageRoute());
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Text(
            Strings.startButtonLabel,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
