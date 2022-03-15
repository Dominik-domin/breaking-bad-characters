import 'package:breaking_bad_characters/helpers/strings.dart';
import 'package:flutter/material.dart';

Color getCharacterStatusColor(String status) {
  if (status == Strings.characterAlive) return Colors.green;
  return Colors.redAccent;
}
