part of 'book_mark_bloc.dart';

@immutable
sealed class BookMarkEvent {}

class AddBookmark extends BookMarkEvent{
  final Bookmark note;
  AddBookmark(this.note);
}
