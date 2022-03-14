import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/pages/character_details_page.dart';
import 'package:breaking_bad_characters/pages/characters_list_page.dart';
import 'package:breaking_bad_characters/pages/home_page.dart';
import 'package:flutter/material.dart';

part "app_router.gr.dart";

@MaterialAutoRouter(routes: [
  AutoRoute<void>(page: HomePage, initial: true),
  AutoRoute<void>(page: CharacterDetailsPage),
  AutoRoute<void>(page: CharactersListPage),
])
class AppRouter extends _$AppRouter {}
