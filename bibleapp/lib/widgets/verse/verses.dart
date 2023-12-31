import 'package:bibleapp/widgets/headers/verse_header.dart';
import 'package:bibleapp/widgets/verse/verse.dart';
import 'package:flutter/material.dart';

import '../../models/chapter/chapter.dart';
import '../../models/verse/verse.dart';

class Verses extends StatelessWidget {
  final List<VerseModel> verses;
  final List<ChapterModel> chapters;
  final String selectedBible;
  final String selectedChapter;
  const Verses(
      {super.key,
      required this.verses,
      required this.chapters,
      required this.selectedBible,
      required this.selectedChapter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VerseHeader(
            chapters: chapters,
            selectedBible: selectedBible,
            selectedChapter: selectedChapter),
        Container(
          margin: const EdgeInsets.only(top: 60),
          child: ListView.builder(
            itemCount: verses.length,
            itemBuilder: (context, index) {
              return Verse(verse: verses[index]);
            },
          ),
        ),
      ],
    );
  }
}
