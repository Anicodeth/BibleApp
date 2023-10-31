part of 'book_mark_bloc.dart';

@immutable
sealed class BookMarkState {
  List<Bookmark> get bookmarks;
}

final class BookMarkInitial extends BookMarkState {
  @override
  final List<Bookmark> bookmarks;

  BookMarkInitial({required this.bookmarks});
}
