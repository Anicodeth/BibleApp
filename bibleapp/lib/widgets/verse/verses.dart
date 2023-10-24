import 'package:bibleapp/widgets/verse/verse.dart';
import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  final List<String> verses;
  const Verses({super.key, required this.verses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: verses.length,
      itemBuilder: (context, index) {
        return Verse(verse: verses[index]);
      },
    );
  }
}
