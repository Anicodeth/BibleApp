import 'package:bibleapp/models/note/note.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {

  final Box<Note> noteBox;

  NoteBloc({required this.noteBox})
      : super(
          NoteInitial(
            note: noteBox.values.toList()
          ),
        ) {
    on<NoteEvent>((event, emit) async {
      
      if(event is AddNote){

        await noteBox.add(event.note);
        List<Note> notes = noteBox.values.toList();

        emit(NoteInitial(note: notes));

      }

    });
  }
}
