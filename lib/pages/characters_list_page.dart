import 'package:breaking_bad_characters/theme/background_gradient.dart';
import 'package:flutter/material.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient2,
        ),
        child: Center(
          child: Text("TEST"),
        ),
      ),
    );
  }
}
