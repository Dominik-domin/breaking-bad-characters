import 'package:breaking_bad_characters/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(character.name ?? '')),
    );
  }
}
