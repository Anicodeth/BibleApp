part of 'bible_reading_bloc.dart';

@immutable
sealed class BibleReadingEvent {}

class BiblesLoaded extends BibleReadingEvent {
  BiblesLoaded();
}

class ChaptersLoaded extends BibleReadingEvent {
  final List<ChapterModel> chapters;

  ChaptersLoaded(this.chapters);
}

class VersesLoaded extends BibleReadingEvent {
  final List<VerseModel> verses;

  VersesLoaded(this.verses);
}
