import 'package:flutter/material.dart';

class Verse extends StatelessWidget {
  final String verse;
  const Verse({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(verse)],
    );
  }
}
