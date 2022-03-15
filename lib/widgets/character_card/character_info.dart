import 'package:breaking_bad_characters/helpers/get_character_status_color.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:flutter/material.dart';

Widget buildCharacterInfo(
  Character character, {
  required EdgeInsets padding,
  double nameFontSize = 16,
  double statusFontSize = 14,
}) =>
    Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            character.name ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: nameFontSize,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            character.status ?? '',
            style: TextStyle(
              color: getCharacterStatusColor(character.status ?? ''),
              fontSize: statusFontSize,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
