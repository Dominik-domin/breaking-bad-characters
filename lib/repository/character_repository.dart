import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:breaking_bad_characters/models/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharactersRepository {
  String baseUrl = 'https://www.breakingbadapi.com/api/';
  late SharedPreferences _sharedPreferences;

  Future<List<Character>> getCharacters({int limit = 10}) async {
    final url = baseUrl + 'character/random' + '?limit=10';
    final response = await http.get(Uri.parse(url));
    _sharedPreferences = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      List<Character> characters = [];

      _sharedPreferences.setString('characters', response.body);

      characters = (json.decode(response.body) as List)
          .map((i) => Character.fromJson(i))
          .toList();

      return characters;
    } else {
      throw Exception('FAILED');
    }
  }
}
