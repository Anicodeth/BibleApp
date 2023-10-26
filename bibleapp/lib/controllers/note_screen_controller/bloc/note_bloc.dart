import 'package:bibleapp/models/note/note.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc()
      : super(
          NoteInitial(
            note: [
              Note(
                  title: "Jhon 1:1",
                  tag: "NASB",
                  note:
                      "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.",
                  date: "today at 4:55"),
            ],
          ),
        ) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
