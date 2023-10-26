import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selector_book_or_note_event.dart';
part 'selector_book_or_note_state.dart';

class SelectorBookOrNoteBloc
    extends Bloc<SelectorBookOrNoteEvent, SelectorBookOrNoteState> {
  SelectorBookOrNoteBloc() : super(SelectorBookOrNoteInitial(whichOne: true)) {
    on<SelectBookmarkEvent>((event, emit) {
      emit(SelectorBookOrNoteInitial(whichOne: true));
    });
    on<SelectNoteEvent>((event, emit) {
      emit(SelectorBookOrNoteInitial(whichOne: false));
    });
  }
}
