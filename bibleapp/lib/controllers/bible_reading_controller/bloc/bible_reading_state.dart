part of 'bible_reading_bloc.dart';

@immutable
sealed class BibleReadingState {}

final class BibleReadingInitial extends BibleReadingState {}

final class BiblesLoadedState extends BibleReadingState {
  final List<BibleModel> bibles;
  BiblesLoadedState(this.bibles);
}

final class SectionsLoadedState extends BibleReadingState {
  final List<SectionModel> sections;
  final String bibleName;
  SectionsLoadedState(this.sections, this.bibleName);
}

final class ChaptersLoadedState extends BibleReadingState {
  final List<ChapterModel> chapters;
  final String bibleName;
  ChaptersLoadedState(this.chapters, this.bibleName);
}

final class VersesLoadedState extends BibleReadingState {
  final List<VerseModel> verses;
  final String bibleName;
  final String chapterName;
  final List<ChapterModel> chapters;
  VersesLoadedState(
      this.verses, this.bibleName, this.chapterName, this.chapters);
}

final class BibleReadingErrorState extends BibleReadingState {
  final String message;
  BibleReadingErrorState(this.message);
}

final class BibleReadingLoadingState extends BibleReadingState {}
