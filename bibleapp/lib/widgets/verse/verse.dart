<<<<<<< HEAD
import 'package:flutter/material.dart';

class Verse extends StatelessWidget {
  final String verse;
  const Verse({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(verse)],
=======
import 'package:bibleapp/models/verse/verse.dart';
import 'package:flutter/material.dart';

class Verse extends StatelessWidget {
  final VerseModel verse;
  const Verse({
    super.key,
    required this.verse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            verse.number,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            verse.text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
>>>>>>> origin/shamil
    );
  }
}
