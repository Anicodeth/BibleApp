import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/bible/bible_list.dart';
import 'package:bibleapp/widgets/bible/section.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
import '../../models/chapter/chapter.dart';
import '../../models/verse/verse.dart';
import '../../widgets/verse/verses.dart';

class BiblePage extends StatelessWidget {
  BiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<BibleReadingBloc, BibleReadingState>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              getContents(state: state),
            ],
          ),
        );
      },
    ));
  }
}

class getContents extends StatelessWidget {
  final state;
  const getContents({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is BiblesLoadedState) {
      return Bibles(bibles: state.bibles);
    } else if (state is SectionsLoadedState) {
      return SectionList(
        sections: state.sections,
        bibleName: state.bibleName,
      );
    } else if (state is VersesLoadedState) {
      return Verses(
        verses: state.verses,
        selectedBible: state.bibleName,
        selectedChapter: state.chapterName,
        chapters: state.chapters,
      );
    } else if (state is BibleReadingLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else {
      BlocProvider.of<BibleReadingBloc>(context).add(BiblesLoaded());
      return const Center(child: Text("Error"));
    }
  }
}
