import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/bible/bible.dart';
import '../../../models/chapter/chapter.dart';
import 'package:bibleapp/models/section/section.dart';
import '../../../models/verse/verse.dart';

part 'bible_reading_event.dart';
part 'bible_reading_state.dart';

class BibleReadingBloc extends Bloc<BibleReadingEvent, BibleReadingState> {
  BibleReadingBloc() : super(BibleReadingInitial()) {
    List<VerseModel> verses= [
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

    final List<SectionModel> newTestamentSections = 
    [
      SectionModel(name: "Matthew", chapters: 28, link: "matthew"),
      SectionModel(name: "Mark", chapters: 16, link: "mark"),
      SectionModel(name: "Luke", chapters: 24, link: "luke"),
      SectionModel(name: "John", chapters: 21, link: "john"),
      SectionModel(name: "Acts", chapters: 28, link: "acts"),
      SectionModel(name: "Romans", chapters: 16, link: "romans"),
      SectionModel(name: "1 Corinthians", chapters: 16, link: "1corinthians"),
      SectionModel(name: "2 Corinthians", chapters: 13, link: "2corinthians"),
      SectionModel(name: "Galatians", chapters: 6, link: "galatians"),
      SectionModel(name: "Ephesians", chapters: 6, link: "ephesians"),
      SectionModel(name: "Philippians", chapters: 4, link: "philippians"),
      SectionModel(name: "Colossians", chapters: 4, link: "colossians"),
      SectionModel(name: "1 Thessalonians", chapters: 5, link: "1thessalonians"),
      SectionModel(name: "2 Thessalonians", chapters: 3, link: "2thessalonians"),
      SectionModel(name: "1 Timothy", chapters: 6, link: "1timothy"),
      SectionModel(name: "2 Timothy", chapters: 4, link: "2timothy"),
      SectionModel(name: "Titus", chapters: 3, link: "titus"),
      SectionModel(name: "Philemon", chapters: 1, link: "philemon"),
      SectionModel(name: "Hebrews", chapters: 13, link: "hebrews"),
      SectionModel(name: "James", chapters: 5, link: "james"),
      SectionModel(name: "1 Peter", chapters: 5, link: "1peter"),
      SectionModel(name: "2 Peter", chapters: 3, link: "2peter"),
      SectionModel(name: "1 John", chapters: 5, link: "1john"),
      SectionModel(name: "2 John", chapters: 1, link: "2john"),
      SectionModel(name: "3 John", chapters: 1, link: "3john"),
      SectionModel(name: "Jude", chapters: 1, link: "jude"),
      SectionModel(name: "Revelation", chapters: 22, link: "revelation"),
    ];

    on<BibleReadingEvent>((event, emit) {
      List<BibleModel> bibles = [
        BibleModel(
            name: "New Testament",
            sections: newTestamentSections),
        BibleModel(
            name: "Genesis",
            sections: newTestamentSections),
        BibleModel(
          name: "Old Testament",
          sections: newTestamentSections),
        BibleModel(
          name: "Gospels",
          sections: [
            SectionModel(name: "Matthew", chapters: 28, link: "matthew"),
            SectionModel(name: "Mark", chapters: 16, link: "mark"),
            SectionModel(name: "Luke", chapters: 24, link: "luke"),
            SectionModel(name: "John", chapters: 21, link: "john"),
          ],
        ),
        BibleModel(
          name: "Pauline Epistles",
          sections: [
            SectionModel(name: "Romans", chapters: 16, link: "romans"),
            SectionModel(name: "1 Corinthians", chapters: 16, link: "1corinthians"),
            SectionModel(name: "2 Corinthians", chapters: 13, link: "2corinthians"),
          ],
        ),
      ];

      // TODO: implement event handler

      if (event is BiblesLoaded) {
        emit(BiblesLoadedState(bibles));
      } else if (event is SectionsLoaded) {
        emit(SectionsLoadedState(event.sections, event.bibleName));
      } else if (event is ChaptersLoaded) {
        emit(ChaptersLoadedState(event.chapters, event.bibleName));
      }
    });
  }
}
