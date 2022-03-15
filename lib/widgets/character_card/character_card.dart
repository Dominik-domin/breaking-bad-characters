import 'package:auto_route/auto_route.dart';
import 'package:breaking_bad_characters/config/app_router.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/widgets/character_card/character_image.dart';
import 'package:breaking_bad_characters/widgets/character_card/character_info.dart';
import 'package:breaking_bad_characters/widgets/icon_button.dart';
import 'package:flutter/material.dart';

Widget buildCharacterCard({
  required Character character,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      context.router.push(
        CharacterDetailsPageRoute(character: character),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black87,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildCharacterImage(character.img ?? ''),
              const SizedBox(width: 10),
              buildCharacterInfo(
                character,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ],
          ),
          buildIconButton(onPressed: () {}),
        ],
      ),
    ),
  );
}
