import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:breaking_bad_characters/models/character.dart';

class CharacterRepository {
  String baseUrl = 'https://www.breakingbadapi.com/api/';

  Future<List<Character>> getCharacters({int limit = 10}) async {
    final url = baseUrl + 'character/random' + '?limit=10';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Character> characters = [];
      characters = (json.decode(response.body) as List)
          .map((i) => Character.fromJson(i))
          .toList();
      return characters;
    } else {
      throw Exception('FAILED');
    }
  }
}
