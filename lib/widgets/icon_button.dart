import 'package:flutter/material.dart';

Widget buildIconButton({
  bool isBackgroundEnabled = true,
  double size = 24,
  Color iconColor = Colors.black,
  required VoidCallback onPressed,
}) =>
    GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isBackgroundEnabled ? Colors.white70 : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.arrow_back,
            color: iconColor,
            size: size,
          ),
        ),
      ),
    );
