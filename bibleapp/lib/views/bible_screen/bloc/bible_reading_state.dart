part of 'bible_reading_bloc.dart';

@immutable
sealed class BibleReadingState {}

final class BibleReadingInitial extends BibleReadingState {}

final class BiblesLoadedState extends BibleReadingState {
  final List<BibleModel> bibles;
  BiblesLoadedState(this.bibles);
}

final class ChaptersLoadedState extends BibleReadingState {
  final List<ChapterModel> chapters;
  ChaptersLoadedState(this.chapters);
}

final class VersesLoadedState extends BibleReadingState {
  final List<VerseModel> verses;
  VersesLoadedState(this.verses);
}

final class BibleReadingErrorState extends BibleReadingState {
  final String message;
  BibleReadingErrorState(this.message);
}

final class BibleReadingLoadingState extends BibleReadingState {}
