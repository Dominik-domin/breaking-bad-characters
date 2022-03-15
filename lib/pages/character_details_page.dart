import 'package:breaking_bad_characters/helpers/strings.dart';
import 'package:breaking_bad_characters/models/character.dart';
import 'package:breaking_bad_characters/theme/background_gradient.dart';
import 'package:breaking_bad_characters/widgets/character_card/character_image.dart';
import 'package:breaking_bad_characters/widgets/character_card/character_info.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCharacterImage(
                  character.img ?? '',
                  size: MediaQuery.of(context).size.width * 0.4,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: buildCharacterInfo(
                      character,
                      nameFontSize: 24,
                      statusFontSize: 18,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (character.birthday != null)
              _buildInfoLabel(
                label: Strings.birthday,
                value: character.birthday ?? '',
              ),
            const SizedBox(height: 16),
            if (character.nickname != null)
              _buildInfoLabel(
                label: Strings.nickname,
                value: character.nickname ?? '',
              ),
            const SizedBox(height: 16),
            _buildTitle(label: Strings.occupation),
            const SizedBox(height: 10),
            _buildInfoLabelList(
              values: character.occupation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle({required String label}) => Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildValueText({required String value}) => Text(
        value,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _buildInfoLabelList({required List<String> values}) => Column(
        children: values.map((value) => _buildValueText(value: value)).toList(),
      );

  Widget _buildInfoLabel({required String label, required String value}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(label: label),
          const SizedBox(height: 10),
          _buildValueText(value: value),
        ],
      );
}
