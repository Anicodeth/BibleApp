import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/bible/bible.dart';
import '../../../models/chapter/chapter.dart';
import '../../../models/verse/verse.dart';

part 'bible_reading_event.dart';
part 'bible_reading_state.dart';

class BibleReadingBloc extends Bloc<BibleReadingEvent, BibleReadingState> {
  BibleReadingBloc() : super(BibleReadingInitial()) {
    on<BibleReadingEvent>((event, emit) {
      List<BibleModel> bibles = [
        BibleModel(name: "Exodus", chapters: [
          ChapterModel(name: "Genesis", verses: [
            VerseModel(
                number: "1", text: "God created the heaven and the earth."),
            VerseModel(number: "2", text: "God then created something else.")
          ])
        ]),
        BibleModel(
            name: "Genesis",
            chapters: [ChapterModel(name: "Genesis", verses: [])]),
        BibleModel(
            name: "Leviticus",
            chapters: [ChapterModel(name: "Genesis", verses: [])]),
        BibleModel(
            name: "Numbers",
            chapters: [ChapterModel(name: "Genesis", verses: [])]),
        BibleModel(
            name: "Deuteronomy",
            chapters: [ChapterModel(name: "Genesis", verses: [])]),
        BibleModel(
            name: "Joshua",
            chapters: [ChapterModel(name: "Genesis", verses: [])]),
      ];
      // TODO: implement event handler

      if (event is BiblesLoaded) {
        emit(BiblesLoadedState(bibles));
      } else if (event is ChaptersLoaded) {
        emit(ChaptersLoadedState(event.chapters));
      } else if (event is VersesLoaded) {
        emit(VersesLoadedState(event.verses));
      }
    });
  }
}
