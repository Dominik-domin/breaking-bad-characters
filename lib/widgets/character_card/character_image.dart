import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCharacterImage(String path, {double size = 80}) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(path),
          fit: BoxFit.contain,
        ),
      ),
    );
