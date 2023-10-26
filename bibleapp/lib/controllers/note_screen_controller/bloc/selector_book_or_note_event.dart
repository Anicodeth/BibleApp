part of 'selector_book_or_note_bloc.dart';

@immutable
sealed class SelectorBookOrNoteEvent {}

class SelectBookmarkEvent implements SelectorBookOrNoteEvent {}

class SelectNoteEvent implements SelectorBookOrNoteEvent {}