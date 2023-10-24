part of 'bible_reading_bloc.dart';

@immutable
sealed class BibleReadingEvent {}

class BiblesLoaded extends BibleReadingEvent {
  BiblesLoaded();
}

class ChaptersLoaded extends BibleReadingEvent {
  final List<ChapterModel> chapters;
  final String bibleName;
  ChaptersLoaded(this.chapters, this.bibleName);
}

class VersesLoaded extends BibleReadingEvent {
  final List<VerseModel> verses;
  final String bibleName;
  final String chapterName;
  final List<ChapterModel> chapters;
  VersesLoaded(this.verses, this.bibleName, this.chapterName, this.chapters);
}
