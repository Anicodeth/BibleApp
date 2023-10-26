part of 'book_mark_bloc.dart';

@immutable
sealed class BookMarkState {
  List<Bookmark> get bookmark;
}

final class BookMarkInitial extends BookMarkState {
  @override
  final List<Bookmark> bookmark;

  BookMarkInitial({required this.bookmark});
}
