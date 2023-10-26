part of 'note_bloc.dart';

@immutable
sealed class NoteState {
  List<Note> get note;
}

final class NoteInitial extends NoteState {
  @override
  final List<Note> note;

  NoteInitial({required this.note});

}
