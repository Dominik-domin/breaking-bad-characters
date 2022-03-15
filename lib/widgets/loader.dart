import 'package:flutter/material.dart';

Widget buildLoader() => const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
      ),
    );
