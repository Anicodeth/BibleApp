part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class AddNote extends NoteEvent{
  final Note note;
  AddNote(this.note);
}
