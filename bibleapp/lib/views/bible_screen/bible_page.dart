import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/bible/bibles.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chapter/chapter.dart';
import '../../models/verse/verse.dart';
import '../../widgets/verse/verses.dart';
import 'bloc/bible_reading_bloc.dart';

class BiblePage extends StatelessWidget {
  BiblePage({super.key});

  List<ChapterModel> chapters = [
    ChapterModel(name: "Chapter 1", verses: []),
    ChapterModel(name: "Chapter 2", verses: []),
    ChapterModel(name: "Chapter 3", verses: []),
    ChapterModel(name: "Chapter 4", verses: []),
    ChapterModel(name: "Chapter 5", verses: []),
    ChapterModel(name: "Chapter 6", verses: []),
  ];

  List<VerseModel> verses = [
    VerseModel(
        number: "1",
        text: "In the beginning God created the heaven and the earth."),
    VerseModel(
        number: "2",
        text:
            "And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters."),
    VerseModel(
        number: "3",
        text: "And God said, Let there be light: and there was light."),
    VerseModel(
        number: "4",
        text:
            "And God saw the light, that it was good: and God divided the light from the darkness."),
    VerseModel(
        number: "5",
        text:
            "And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day."),
    VerseModel(
        number: "6",
        text:
            "And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters."),
    VerseModel(
        number: "7",
        text:
            "And God made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so."),
    VerseModel(
        number: "8",
        text:
            "And God called the firmament Heaven. And the evening and the morning were the second day."),
    VerseModel(
        number: "9",
        text:
            "And God said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so."),
    VerseModel(
        number: "10",
        text:
            "And God called the dry land Earth; and the gathering together of the waters called he Seas: and God saw that it was good."),
    VerseModel(
        number: "11",
        text:
            "And God said, Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth: and it was so."),
    VerseModel(
        number: "12",
        text:
            "And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and God saw that it was good."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: const Text(
            "Bible",
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: BlocBuilder<BibleReadingBloc, BibleReadingState>(
          builder: (context, state) {
            if (state is BiblesLoadedState) {
              return Bibles(bibles: state.bibles);
            } else if (state is ChaptersLoadedState) {
              return Chapters(chapters: state.chapters);
            } else if (state is VersesLoadedState) {
              return Verses(verses: state.verses);
            } else if (state is BibleReadingLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              BlocProvider.of<BibleReadingBloc>(context).add(BiblesLoaded());
              return const Center(child: Text("Error"));
            }
          },
        ));
  }
}
