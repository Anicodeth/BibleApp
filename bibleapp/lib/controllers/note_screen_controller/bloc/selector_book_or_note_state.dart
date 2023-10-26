part of 'selector_book_or_note_bloc.dart';

@immutable
sealed class SelectorBookOrNoteState {
  bool get whichOne;
}

final class SelectorBookOrNoteInitial extends SelectorBookOrNoteState {
  @override
  final bool whichOne;

  SelectorBookOrNoteInitial({required this.whichOne});
}
