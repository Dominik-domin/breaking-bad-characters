import 'package:breaking_bad_characters/helpers/strings.dart';
import 'package:breaking_bad_characters/widgets/icon_button.dart';
import 'package:flutter/material.dart';

Widget buildGetCharactersHint({required BuildContext context}) => Container(
      height: 80,
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              Strings.getCharactersHint,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            buildIconButton(
              isBackgroundEnabled: false,
              size: 32,
              iconColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
